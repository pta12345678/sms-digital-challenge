# frozen_string_literal: true

WORDLIST_PATH = './sample_tags.txt'
class WordlistRepository
  def get_words(amount)
    # Works best with small lists!
    File.readlines(WORDLIST_PATH).sample(amount).collect(&:chomp)
  end
end
