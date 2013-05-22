#add_source 'https://rubygems.org'

gem 'inherited_resources'
gem 'kaminari'
gem 'haml'
gem 'has_scope'
gem 'responders'


gem 'formtastic'  #, :git => 'git://github.com/justinfrench/formtastic.git', :branch => '2.1-stable', :require => 'formtastic'
#gem 'formtastic-bootstrap', :git => 'git://github.com/cgunther/formtastic-bootstrap.git', :branch => 'bootstrap2-rails3-2-formtastic-2-1', :require => 'formtastic-bootstrap'


gem 'tablegrid', :git => 'git://github.com/rostchri/tablegrid.git'
gem 'railstrap', :git => 'git://github.com/rostchri/railstrap.git', :branch => 'develop'

#gem 'less-rails'
gem 'rails_kickstrap', :git => 'https://github.com/snoepkast/rails_kickstrap.git'



gem_group :assets do
  gem 'jquery-rails'
  gem 'coffee-rails'
  gem 'jquery-ui-rails'
end


git :init
git add: "."
git commit: %Q{ -m 'Initial commit' }
