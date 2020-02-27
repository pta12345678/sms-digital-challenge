require 'dry-auto_inject'

class TagExtenderService

  def initialize(repository)
    @repository = repository
  end

  def get_unique_tags(amount)
    @repository.get_unique_tags_from_wordlist(amount)
  end
end
