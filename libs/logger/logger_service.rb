class LoggerService

  def initialize(logger_repository)
    @logger_repository = logger_repository
  end

  def info(message)
    @logger_repository.info(message)
  end

  def verbose(message)
    @logger_repository.verbose(message)
  end
end
