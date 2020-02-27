require 'optparse'

class ParseCliOptions 
  def parse
    options = {}
    OptionParser.new do |opts|
      opts.on("-v", "--verbose", "Show extra information") do
        options[:verbose] = true
      end
    
      opts.on("-k=KEYWORDS", "--keywords=KEYWORDS", "Specify keywords to query for, separated by comma.") do |raw_keywords|
        options[:keywords] = raw_keywords.split(",")
      end
    end.parse!
    
    return options
  end
end
