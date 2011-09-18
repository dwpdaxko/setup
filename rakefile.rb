require 'rake'
require 'rake/clean'
require 'fileutils'
require 'erb'
require 'configatron'

%w[utils configuration tasks].each do|folder|
  Dir.glob(File.join(File.dirname(__FILE__),"build/#{folder}/*.rb")).each do|item|
    require item
  end
end

Rake::Task['expand_all_template_files'].invoke


task :init do
end

