require "./libs/parse_cli_options"

class CliAdapter 
  def start
    args = ParseCliOptions.new.parse
    print "args: #{args}"
  end
end

CliAdapter.new.start