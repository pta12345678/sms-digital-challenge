require 'mini_magick'

class MiniMagickRepository
  def scale_image(path_to_image)
    image = MiniMagick::Image.open(path_to_image)
    image.resize "100x100" # Crop vs. Resize - Cropping loses information - is this wanted behavior? Seems faulty..
    image.write path_to_image
  end

  def combine_images(image_paths, target_filename)

    MiniMagick::Tool::Convert.new do |convert|
      convert.append.+
      image_paths.each {|image_path|
        convert << image_path
      }
      convert << target_filename
    end

    p "output_file: #{target_filename}"
    p "would combine but not now.."
  end
end
