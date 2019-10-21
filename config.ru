require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

require 'controller'

run ApplicationController
#execute la classe Application Controller dans controller.rb