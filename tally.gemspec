# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tally}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Theo Cushion"]
  s.date = %q{2009-04-30}
  s.email = %q{theo@jivatechnology.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "generators/tally/USAGE",
    "generators/tally/tally_generator.rb",
    "generators/tally/templates/tally_migration.rb.erb",
    "lib/tally.rb",
    "lib/tally/tallyable.rb",
    "lib/tally/voter.rb",
    "rails/init.rb",
    "test/database.yml",
    "test/helper.rb",
    "test/tally_test.rb",
    "test/tallyable_test.rb",
    "test/test_helper.rb",
    "test/voter_test.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/theoooo/tally}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/helper.rb",
    "test/tally_test.rb",
    "test/tallyable_test.rb",
    "test/test_helper.rb",
    "test/voter_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
