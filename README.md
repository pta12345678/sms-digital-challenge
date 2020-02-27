# SMS Digital Challenge - Creating a flicker collage (Philipp Tusch)

This repository will query the flicker API and create an image collage out of 10 images.
The created collage will be written to file.

## Requirements
* Ruby
* bundler
* `ImageMagick` to crop images
* Unix* (Windows image crop libraries are a pain to setup, so spare yourself this trouble if possible)

## Building
`bundler install`

## Build the gem
`gem build .gemspec`

## Install the created gem
(Allows usage as normal CLI)

`gem install sms-digital-challenge-flickr-*.gem`

## Usage
* Register at flickr and fetch an API key and secrect ([signup](https://identity.flickr.com/sign-up), [get api key](https://www.flickr.com/services/apps/create/apply/))
* Expose your API key in the shell environment `FLICKR_API_KEY=xxx`
* Export your shared API secret in the shell environment `FLICKR_SHARED_SECRET=xxx`

### Sample calls
* Invoke the help for all possible options
```bash
$ ruby bin/sms-digital-flickr-collage -h
Usage: sms-digital-flickr-collage [options]
    -k, --keywords=KEYWORDS          Specify keywords to query for, separated by comma.
    -o, --output=OUTPUT              Specify the output path for the collage
    -v, --verbose                    Enable verbosity
```

* Call with invalid keywords
```bash
$ ruby bin/sms-digital-flickr-collage -k yyyyyyyyyyyyyyyyyyyyyyyy
Collage has been written to /tmp/0713ea3c-8514-4d39-805b-fa1aa86de2de
```

* Call with valid keywords, but too few
```bash
$ ruby bin/sms-digital-flickr-collage -k cheese
Collage has been written to /tmp/7553d630-a29d-4a57-a8a3-e453864dec9f
```

* Call with valid keywords, but too few and an output path
```bash
$ ruby bin/sms-digital-flickr-collage -k cheese -o xxx
Collage has been written to /home/phil/code/sms-digital-challenge/xxx
```

## Design choices

The applications follows a simple, yet effective approach:
Adapter -> Use Case -> Service -> Repository

It's extremely easy to put all elements together and change repositories on the fly as well.
Config becomes code and entire new sub branches of the code could be loaded if a defined condition (license etc.) is met.

## Limitations
* It was never stated how exactly the grid has to be, so I choose a 10x1 grid which is still a grid
* The calls to flickr are duplicated since each tag is checked first (for existence) and then to get the photo. Memoizing and a simple cache could help
* Proper exit codes and messages for all sort of issues because it wasn't asked for
