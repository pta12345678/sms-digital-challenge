# frozen_string_literal: true

class WordlistRepository
  @@wordlist_path = './sample_tags.txt'
  def get_words(amount)
    # Works best with small lists!
    File.readlines(@@wordlist_path).sample(amount).collect(&:chomp)
  end
end
