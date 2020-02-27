Gem::Specification.new do |s|
  s.name          = 'sms-digital-challenge'
  s.version       = '0.1.0'
  s.date          = '2020-02-27'
  s.summary       = "Solving a challenge to query some APIs"
  s.description   = "Solving a challenge to query some APIs"
  s.authors       = ["Philipp Tusch"]
  s.email         = 'philipp.tusch@gmx.de'
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.license       = 'MIT'
end
