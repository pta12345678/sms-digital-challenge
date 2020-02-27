require 'set'

class TagExtenderWordlistRepository
  @wordlist_path = './../sample_tags.txt'
  def get_unique_tags_from_wordlist(amount)
    # Works best with small lists!
    return File.readlines('./sample_tags.txt').sample(amount).collect {|entry|
      entry.chomp
    }
  end
end
