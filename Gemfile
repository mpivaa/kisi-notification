source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'sinatra', '2.0.0'
gem 'rack-test', '0.8.2'
gem 'rake', '12.1.0'
gem 'sucker_punch', '2.0.4'
gem 'mail', '2.6.6'

group :development, :test do
  gem 'dotenv', '2.2.1'
end

group :test do
  gem 'minitest', '5.10.3'
end
