# -*- encoding: utf-8 -*-
# stub: blogger 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "blogger".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael J. Edgar".freeze]
  s.date = "2009-03-24"
  s.description = "The Blogger module provides services related to Blogger, and only blogger. The GData gem is great, but it provides a much lower-level interface to Google's Blogger API. With the Blogger gem, you have full access to the Blogger API,  with easy to use classes, and it integrates with 6 different markup/markdown  gems! What's more, you won't have to muck around with XML.  Sure, XML is easy. But why waste time messing around with it? With just 3 or 4 lines of Blogger.gem code, you'll be able to take a markdown-formatted string and post it as a blog post, with categories, and comments.  You can also search through all of your comments, old posts, and pretty much anything you can do at the blogger.com website, you can do with this gem.".freeze
  s.email = ["edgar@triqweb.com".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze]
  s.homepage = "http://beforefilter.blogspot.com/".freeze
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubyforge_project = "blogger".freeze
  s.rubygems_version = "2.6.6".freeze
  s.summary = "The Blogger module provides services related to Blogger, and only blogger".freeze

  s.installed_by_version = "2.6.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<atom-tools>.freeze, [">= 2.0.1"])
      s.add_development_dependency(%q<hoe>.freeze, [">= 1.11.0"])
    else
      s.add_dependency(%q<atom-tools>.freeze, [">= 2.0.1"])
      s.add_dependency(%q<hoe>.freeze, [">= 1.11.0"])
    end
  else
    s.add_dependency(%q<atom-tools>.freeze, [">= 2.0.1"])
    s.add_dependency(%q<hoe>.freeze, [">= 1.11.0"])
  end
end
