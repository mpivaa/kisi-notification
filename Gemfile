source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'sinatra', '2.0.0'
gem 'rack-test', '0.8.2'
gem 'rake', '12.1.0'

group :test do
  gem 'minitest'
end
