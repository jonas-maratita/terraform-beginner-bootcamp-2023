# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for Ruby. 
It is the primary what to install ruby packages (gems) for Ruby.

#### Install Gems

Create a Gemfile and define gems in this file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which installs packages in a folder called node_modules)

#### Executing Ruby scripts in the context of bundler

`bundle exec` must be used to tell future ruby scripts to use the gems we installed. This is the way context is set.

### [Sinatra](https://sinatrarb.com/)

Sinatra is a micro web-framework for Ruby to build web-apps

It is a great for mock or development serviers or for very simple projects

A web-server can be created in a single file

## Terratowns Mock Web Server

### Running the web server

We can run the web server by executing the following command

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

## [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)

Terraform Provider resources utilize CRUD

CRUD stands for create, read, update, delete

