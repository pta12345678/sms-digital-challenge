# frozen_string_literal: true

require 'securerandom'

class ImageService
  def initialize(image_repository)
    @image_repository = image_repository
  end

  def scale_image(path_to_image)
    @image_repository.scale_image(path_to_image)
  end

  def combine_images(image_paths, target_filename)
    output_file = if target_filename.nil?
                    File.join(Dir.tmpdir, SecureRandom.uuid)
                  else
                    target_filename
    end

    written_to = @image_repository.combine_images(image_paths, output_file)
    File.expand_path(written_to)
  end
end
