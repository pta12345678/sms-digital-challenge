# frozen_string_literal: true

require 'dry-auto_inject'

class WordlistService
  def initialize(repository)
    @repository = repository
  end

  def get_words(amount)
    @repository.get_words(amount)
  end
end
