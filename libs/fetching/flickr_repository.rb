require 'flickraw'
require 'open-uri'
require 'tmpdir'
require 'securerandom'

class FlickrRepository

  def initialize()
    FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret = ENV["FLICKR_SHARED_SECRET"]
    @flickr = FlickRaw::Flickr.new
  end

  def download_by_tags(tags)
    tags.collect {|tag|
      uri = self.find_photo_by_tag(tag)
      self.write_uri_to_file(uri)
    }
  end

  def find_hot_tags(amount)
    # we take more and sample afterwards for better randomness
    response = @flickr.tags.getHotList(:count => amount * 10)
    response.tag.sample(amount).collect {|tag|
      tag._content
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
