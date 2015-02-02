require 'json'
require 'RMagick'

config = JSON.parse(File.read('example/config.json'))

correct = nil
regression = nil
config["tests"].each do |test|
	correct = Magick::Image.read(test["correct_img"]).first
	regression = Magick::Image.read(test["regression_img"]).first
end

puts correct.difference(regression)