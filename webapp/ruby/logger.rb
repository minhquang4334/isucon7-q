require 'logger'
require 'sinatra/custom_logger'
require 'sinatra'
require 'logger/ltsv'

module Logger
  helpers Sinatra::CustomLogger

  configure :development, :production do
    logger = Logger.new(File.open("isucon.log", 'a'))
    logger.level = Logger::DEBUG
    logger.formatter = Logger::LTSVFormatter.new
    set :logger, logger
  end
end
