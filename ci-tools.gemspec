Gem::Specification.new do |s|
  s.name        = 'ci-tools'
  s.version     = '0.0.0'
  s.date        = '2011-06-03'
  s.summary     = "Tools for CI and QA"
  s.description = ""
  s.files       = s.files = `git ls-files`.split("\n")
  s.executables = ['ci-health-check', 'ci-api-check']
  s.add_runtime_dependency "patron", ["0.4.9"]
  s.add_development_dependency "ruby-debug"
  s.add_development_dependency "webmock"
  s.add_development_dependency "rspec", ["2.6.0"]
end

