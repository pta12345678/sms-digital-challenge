# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'sms-digital-challenge-flickr'
  s.version       = '0.1.0'
  s.date          = '2020-02-27'
  s.homepage      = 'https://github.com/pta12345678'
  s.summary       = 'Solving a challenge for sms-digital'
  s.description   = 'Solving a challenge to query some images and build a proper collage out of it'
  s.authors       = ['Philipp Tusch']
  s.email         = 'philipp.tusch@gmx.de'
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = 'sms-digital-flickr-collage'
  s.require_paths = ['lib']
  s.license       = 'MIT'
end
