require "./libs/parse_cli_options"

class CliAdapter

  def initialize(use_case)
    @use_case = use_case
  end

  def start
    args = ParseCliOptions.new.parse
    valid_tags = @use_case.build_verified_tags(args[:keywords])
    @use_case.create_collage_grid(valid_tags, args[:output_path])
  end
end
