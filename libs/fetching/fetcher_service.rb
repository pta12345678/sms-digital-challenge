class FetcherService
  def initialize(fetcher_repository)
    @fetcher_repository = fetcher_repository
  end

  def download_by_tags(tags)
    @fetcher_repository.download_by_tags(tags)
  end

  def find_photo_by_tag(tag)
    @fetcher_repository.find_photo_by_tag(tag)
  end

  def find_hot_tags(amount)
    @fetcher_repository.find_hot_tags(amount)
  end

  def write_uri_to_file(uri)
    @fetcher_repository.write_uri_to_file(uri)
  end
end
