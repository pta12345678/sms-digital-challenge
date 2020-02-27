class UseCase

  def initialize(tag_extender_service, image_fetcher_service, image_service)
    @tag_extender_service = tag_extender_service
    @image_fetcher_service = image_fetcher_service
    @image_service = image_service
  end

  def create_collage_grid(passed_keywords = [], collage_path)
    other_keywords = @tag_extender_service.get_unique_tags(10 - passed_keywords.length)
    keywords = passed_keywords + other_keywords

    image_paths = @image_fetcher_service.download_by_tags(keywords)
    image_paths.each{|image_path|
      @image_service.scale_image(image_path)
    }

    @image_service.combine_images(image_paths, collage_path)
  end
end
