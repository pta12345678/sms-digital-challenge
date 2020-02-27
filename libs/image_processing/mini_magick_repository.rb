# frozen_string_literal: true

require 'mini_magick'

class MiniMagickRepository
  def scale_image(path_to_image)
    image = MiniMagick::Image.open(path_to_image)
    image.resize '100x100' # Crop vs. Resize - Cropping loses information - is this wanted behavior? Seems faulty..
    image.write path_to_image
  end

  def combine_images(image_paths, target_filename)
    MiniMagick::Tool::Convert.new do |convert|
      convert.append.+
      image_paths.each do |image_path|
        convert << image_path
      end
      convert << target_filename
    end

    target_filename
  end
end
