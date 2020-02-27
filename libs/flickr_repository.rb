require 'flickraw'
require 'open-uri'
require 'tmpdir'
require 'securerandom'

class FlickrRepository

  def initialize()
    FlickRaw.api_key = ""
    FlickRaw.shared_secret = ""
    @flickr = FlickRaw::Flickr.new
  end

  def download_by_tags(tags)
    tags.collect {|tag|
      uri = self.find_photo_by_tag(tag)
      self.write_uri_to_file(uri)
    }
  end

  def find_photo_by_tag(tag)
    found_images = @flickr.photos.search(:tags => [tag], :per_page => 1, :sort => "interestingness-desc")
    if found_images.length <= 0 then
      raise "Could not find any photo for tag '#{tag}'"
    end
    x = @flickr.photos.getSizes(:photo_id => found_images[0].id)
    return x[1].source
  end

  def write_uri_to_file(uri)
    tmpfile = File.join(Dir.tmpdir(), SecureRandom.uuid)

    URI.open(uri) do |image|
      File.open(tmpfile, 'wb') do |file|
        file.write(image.read)
      end
    end
    return tmpfile
  end

end

#flick = FlickrRepository.new
#uri = flick.find_photo_by_tag('cat')
#path = flick.write_uri_to_file(uri)
#flick.crop_image(path)
