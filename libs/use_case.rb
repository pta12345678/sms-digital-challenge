class UseCase

  @@NEEDED_TAGS = 10
  def initialize(tag_extender_service, image_fetcher_service, image_service)
    @tag_extender_service = tag_extender_service
    @image_fetcher_service = image_fetcher_service
    @image_service = image_service
  end

  def is_tag_valid(tag)
    begin
      @image_fetcher_service.find_photo_by_tag(tag)
      return true
    rescue
      return false
    end
  end

  def verify_tags(tags)
    tags.select{|tag|
      self.is_tag_valid(tag)
    }
  end

  def build_verified_tags(passed_keywords = [])
    other_keywords = @tag_extender_service.get_unique_tags(10 - passed_keywords.length)
    keywords = passed_keywords + other_keywords
    verified_tags = self.verify_tags(keywords)

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
end
