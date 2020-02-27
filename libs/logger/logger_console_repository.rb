class LoggerConsoleRepository
  def info(message)
    puts message
  end

  def verbose(message)
    # I know this is bad practice but figuring out how to properly work with
    # DRY DI took longer so I skipped that and made it myself.
    if $is_verbose then
      puts message
    end
  end
end
