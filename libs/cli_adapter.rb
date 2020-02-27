require "./libs/parse_cli_options"

class CliAdapter

  def initialize(use_case)
    @use_case = use_case
  end

  def start
    args = ParseCliOptions.new.parse
    @use_case.create_collage_grid(args[:keywords], args[:output_path])
  end
end
