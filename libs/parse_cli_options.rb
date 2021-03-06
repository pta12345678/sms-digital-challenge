# frozen_string_literal: true

require 'optparse'

class ParseCliOptions
  def parse
    options = {
      keywords: [],
      output_path: nil
    }
    OptionParser.new do |opts|
      opts.on('-k=KEYWORDS', '--keywords=KEYWORDS', 'Specify keywords to query for, separated by comma.') do |raw_keywords|
        options[:keywords] = raw_keywords.split(',')
      end

      opts.on('-o=OUTPUT', '--output=OUTPUT', 'Specify the output path for the collage') do |output_path|
        options[:output_path] = output_path
      end

      opts.on('-v', '--verbose', 'Enable verbosity') do
        $is_verbose = true
      end
    end.parse!

    options
  end
end
