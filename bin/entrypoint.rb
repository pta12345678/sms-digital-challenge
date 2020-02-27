require './libs/image_processing/mini_magick_repository'
require './libs/image_processing/image_service'
require './libs/tag_finder/tag_extender_wordlist_repository'
require './libs/tag_finder/tag_extender_service'
require './libs/fetching/flickr_repository'
require './libs/fetching/fetcher_service'
require './libs/use_case'
require './libs/cli_adapter'

# Would have used existing DI library but dry-rb seems weird to use without ruby knowledge
# DI Setup
tag_extender_repository = TagExtenderWordlistRepository.new
tag_extender_service = TagExtenderService.new(tag_extender_repository)

mini_magick_repository = MiniMagickRepository.new
image_service = ImageService.new(mini_magick_repository)

flickr_respository = FlickrRepository.new
fetcher_service = FetcherService.new(flickr_respository)

use_case = UseCase.new(tag_extender_service, fetcher_service, image_service)

cli_adapter = CliAdapter.new(use_case)

# Actual workflow kickoff
cli_adapter.start
