Gem::Specification.new do |s|
  s.name        = 'ci-utils'
  s.author      = 'Paul Hepworth'
  s.email       = 'paul<dot>hepworth<at>peppyheppy<dot>com'
  s.homepage    = 'https://github.com/peppyheppy/ci-utils'
  s.version     = '0.0.1'
  s.date        = '2011-06-03'
  s.summary     = "Tools for CI and QA"
  s.description = ""
  s.files       = s.files = `git ls-files`.split("\n")
  s.executables = ['ci-health-check', 'ci-api-check']
  s.add_runtime_dependency "patron"
  s.add_development_dependency "ruby-debug19"
  s.add_development_dependency "webmock"
  s.add_development_dependency "rspec", ["2.6.0"]
end

