class UseCase

  @@NEEDED_TAGS = 10
  def initialize(wordlist_service, image_fetcher_service, image_service)
    @wordlist_service = wordlist_service
    @image_fetcher_service = image_fetcher_service
    @image_service = image_service
  end

  def build_verified_tags(passed_keywords = [])
    other_keywords = @wordlist_service.get_words(10 - passed_keywords.length)
    keywords = passed_keywords + other_keywords
    verified_tags = self._verify_tags(keywords)

    if verified_tags.length == @@NEEDED_TAGS then
      return verified_tags
    end

    tags = @image_fetcher_service.find_hot_tags(@@NEEDED_TAGS - verified_tags.length)
    self.build_verified_tags(tags)
  end

  def create_collage_grid(passed_keywords, collage_path)
    image_paths = @image_fetcher_service.download_by_tags(passed_keywords)
    image_paths.each{|image_path|
      @image_service.scale_image(image_path)
    }

    written_to = @image_service.combine_images(image_paths, collage_path)
    puts "Collage has been written to #{written_to}"
  end

  def _is_tag_valid(tag)
    begin
      @image_fetcher_service.find_photo_by_tag(tag)
      return true
    rescue
      return false
    end
  end

  def _verify_tags(tags)
    tags.select{|tag|
      self._is_tag_valid(tag)
    }
  end
end
