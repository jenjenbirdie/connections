# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-mocks"
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Chelimsky", "Chad Humphries"]
  s.date = "2010-10-17"
  s.description = "RSpec's 'test double' framework, with support for stubbing and mocking"
  s.email = "dchelimsky@gmail.com;chad.humphries@gmail.com"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "http://github.com/rspec/rspec-mocks"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "1.8.15"
  s.summary = "rspec-mocks-2.0.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec-core>, ["~> 2.0.1"])
      s.add_runtime_dependency(%q<rspec-expectations>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<rspec-core>, ["~> 2.0.1"])
      s.add_dependency(%q<rspec-expectations>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<rspec-core>, ["~> 2.0.1"])
    s.add_dependency(%q<rspec-expectations>, ["~> 2.0.1"])
  end
end
