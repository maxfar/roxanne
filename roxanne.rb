require 'json'
require "thor"
require 'open3'

class Roxanne < Thor

	desc "get", "gets all the configured screenshots needed to run tests"
	def get(config_path)
		if !File.exist?(config_path)
			puts "Config file doesn't exist"
			exit
		end

		config = JSON.parse(File.read(config_path))

		config["tests"].each do |test|
			cmd = "ruby " + test["capybara"] + " " + test["regression_img"] 
			Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|

			end
		end
	end
end

Roxanne.start(ARGV)