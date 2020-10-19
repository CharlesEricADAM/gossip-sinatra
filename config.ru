# fichier rack up, contains info to launch ruby servers
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
require 'csv'

run ApplicationController