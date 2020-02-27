# frozen_string_literal: true

NEEDED_TAGS = 10
class UseCase
  def initialize(logger_service, wordlist_service, image_fetcher_service, image_service)
    @wordlist_service = wordlist_service
    @image_fetcher_service = image_fetcher_service
    @image_service = image_service
    @logger_service = logger_service
  end

  def build_verified_tags(passed_keywords = [])
    other_keywords = @wordlist_service.get_words(10 - passed_keywords.length)
    keywords = passed_keywords + other_keywords
    verified_tags = _verify_tags(keywords)

    return verified_tags if verified_tags.length == NEEDED_TAGS

    tags = @image_fetcher_service.find_hot_tags(NEEDED_TAGS - verified_tags.length)
    build_verified_tags(tags)
  end

  def create_collage_grid(passed_keywords, collage_path)
    image_paths = @image_fetcher_service.download_by_tags(passed_keywords)
    image_paths.each do |image_path|
      @image_service.scale_image(image_path)
    end

    written_to = @image_service.combine_images(image_paths, collage_path)
    @logger_service.info("Collage has been written to #{written_to}")
  end

  def _is_tag_valid(tag)
    @image_fetcher_service.find_photo_by_tag(tag)
    true
  rescue StandardError
    false
  end

  def _verify_tags(tags)
    tags.select do |tag|
      _is_tag_valid(tag)
    end
  end
end
