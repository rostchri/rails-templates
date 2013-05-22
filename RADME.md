# Rails-templates
## Howto use
### Prepare environment for new rails-project
	rvm 1.9.3@global 
	rvm gemset create <project> 
	rvm 1.9.3@<project>
	gem install rails
### Create Project using template
	rails new <project> -m kickstrap.rb
	or: rails new <project> -m https://raw.github.com/rostchri/rails-templates/master/kickstrap.rb
	