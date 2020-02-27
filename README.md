# SMS Digital Challenge - Creating a flicker collage (Philipp Tusch)

This repository will query the flicker API and create an image collage out of 10 images.
The created collage will be written to file.

## Requirements
* Ruby
* bundler
* `ImageMagick` to crop images
* Unix* (Windows image crop libraries are a pain to setup, so spare yourself this trouble if possible)

## building
`bundler install`

## Usage
* Register at flickr and fetch an API key and secrect ([signup](https://identity.flickr.com/sign-up), [get api key](https://www.flickr.com/services/apps/create/apply/))
* Expose your API key in the shell environment `FLICKR_API_KEY=xxx`
* Export your shared API secret in the shell environment `FLICKR_SHARED_SECRET=xxx`

### Sample calls
* Call with invalid keywords
```bash
$ ruby bin/entrypoint.rb -k yyyyyyyyyyyyyyyyyyyyyyyy
Collage has been written to /tmp/0713ea3c-8514-4d39-805b-fa1aa86de2de
```

* Call with valid keywords, but too few
```bash
$ ruby bin/entrypoint.rb -k cheese
Collage has been written to /tmp/7553d630-a29d-4a57-a8a3-e453864dec9f
```

* Call with valid keywords, but too few and an output path
```bash
$ ruby bin/entrypoint.rb -k cheese -o xxx
Collage has been written to /home/phil/code/sms-digital-challenge/xxx
```
