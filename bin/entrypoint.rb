require './libs/image_processing/mini_magick_repository'
require './libs/image_processing/image_service'
require './libs/wordlist_finder/wordlist_repository'
require './libs/wordlist_finder/wordlist_service'
require './libs/fetching/flickr_repository'
require './libs/fetching/fetcher_service'
require './libs/use_case'
require './libs/cli_adapter'

# Would have used existing DI library but dry-rb seems weird to use without ruby knowledge
# DI Setup
wordlist_repository = WordlistRepository.new
wordlist_service = WordlistService.new(wordlist_repository)

mini_magick_repository = MiniMagickRepository.new
image_service = ImageService.new(mini_magick_repository)

flickr_respository = FlickrRepository.new
fetcher_service = FetcherService.new(flickr_respository)

use_case = UseCase.new(wordlist_service, fetcher_service, image_service)

cli_adapter = CliAdapter.new(use_case)

# Actual workflow kickoff
cli_adapter.start
