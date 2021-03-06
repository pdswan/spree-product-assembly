# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{spree_product_assembly}
  s.version = "0.30.1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Smirnov"]
  s.date = %q{2010-09-15}
  s.description = %q{Adds oportunity to make bundle of products to your Spree store.}
  s.email = %q{roman@railsdog.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "app/controllers/admin/parts_controller.rb",
     "app/helpers/admin/parts_helper.rb",
     "app/models/assemblies_part.rb",
     "app/views/admin/parts/_parts_table.html.erb",
     "app/views/admin/parts/available.js.erb",
     "app/views/admin/parts/index.html.erb",
     "app/views/admin/products/_product_assembly_fields.html.erb",
     "app/views/admin/shared/_product_assembly_product_tabs.html.erb",
     "app/views/orders/_cart_description.html.erb",
     "config/locales/en.yml",
     "config/locales/fr-FR.yml",
     "config/locales/ru-RU.yml",
     "config/routes.rb",
     "test/functional/admin/parts_controller_test.rb",
     "test/functional/product_assembly_extension_test.rb",
     "test/test_helper.rb",
     "test/unit/helpers/admin/parts_helper_test.rb",
     "test/unit/inventory_unit_test.rb",
     "test/unit/product_test.rb"
  ]
  s.homepage = %q{http://github.com/spree/spree-product-assembly}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Adds oportunity to make bundle of products to your Spree store.}
  s.test_files = [
    "test/functional/product_assembly_extension_test.rb",
     "test/functional/admin/parts_controller_test.rb",
     "test/test_helper.rb",
     "test/unit/helpers/admin/parts_helper_test.rb",
     "test/unit/inventory_unit_test.rb",
     "test/unit/product_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, [">= 0.30.0.beta1"])
    else
      s.add_dependency(%q<spree_core>, [">= 0.30.0.beta1"])
    end
  else
    s.add_dependency(%q<spree_core>, [">= 0.30.0.beta1"])
  end
end

