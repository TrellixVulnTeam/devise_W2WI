# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "omniauth-google-oauth2"
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Ellithorpe", "Yury Korolev"]
  s.date = "2014-10-28"
  s.description = "A Google OAuth2 strategy for OmniAuth 1.x"
  s.email = ["quest@mac.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.0"
  s.summary = "A Google OAuth2 strategy for OmniAuth 1.x"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>, ["> 1.0"])
      s.add_runtime_dependency(%q<omniauth-oauth2>, ["~> 1.1"])
      s.add_development_dependency(%q<rspec>, [">= 2.14.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<omniauth>, ["> 1.0"])
      s.add_dependency(%q<omniauth-oauth2>, ["~> 1.1"])
      s.add_dependency(%q<rspec>, [">= 2.14.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<omniauth>, ["> 1.0"])
    s.add_dependency(%q<omniauth-oauth2>, ["~> 1.1"])
    s.add_dependency(%q<rspec>, [">= 2.14.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
