require "rubygems"
require "bundler/setup"

require "logger"
require "json"
require "yaml"
require 'hashids'

require "sinatra/activerecord"

CODE_ROOT = File.join(
  File.expand_path(File.dirname(__FILE__)),
  ".."
) unless defined? CODE_ROOT

yml = File.open(File.join(CODE_ROOT, 'config', 'dev.yml')) do |file|
  file.read
end

CONFIG = YAML.load(yml)
warn CONFIG

%w[model].each do |dir|
  Dir.glob(File.join(CODE_ROOT, "lib/#{dir}/*.rb")).each do |libname|
    warn "loading ==> #{libname}"
    require libname
  end
end
