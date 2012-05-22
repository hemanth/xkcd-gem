Gem::Specification.new do |s|
  s.name               = "xkcd"
  s.version            = "0.0.3"
  s.default_executable = "xkcd"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Hemanth.HM"]
  s.date = %q{2012-05-20}
  s.description = %q{A simple gem to get random img/comic url from xkcd}
  s.email = %q{hemanth.hm@gmail.com}
  s.files = ["Rakefile", "lib/xkcd.rb", "bin/xkcd"]
  s.test_files = Dir.glob('test/*.rb')
  s.homepage = %q{http://rubygems.org/gems/xkcd}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{XCKD random img urls!}
  s.bindir = 'bin'
  s.executables = 'xkcd'

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

