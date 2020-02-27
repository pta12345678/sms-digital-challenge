require 'optparse'

class ParseCliOptions
  def parse
    options = {}
    OptionParser.new do |opts|
      opts.on("-k=KEYWORDS", "--keywords=KEYWORDS", "Specify keywords to query for, separated by comma.") do |raw_keywords|
        options[:keywords] = raw_keywords.split(",")
      end

      opts.on("-o=OUTPUT", "--output=OUTPUT", "Specify the output path for the collage") do |output_path|
        options[:output_path] = output_path
      end
    end.parse!

    return options
  end
end
