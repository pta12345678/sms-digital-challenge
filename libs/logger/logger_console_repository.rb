# frozen_string_literal: true

class LoggerConsoleRepository
  def info(message)
    puts message
  end

  def verbose(message)
    # I know this is bad practice but figuring out how to properly work with
    # DRY DI took longer so I skipped that and made it myself.
    puts message if $is_verbose
  end
end
