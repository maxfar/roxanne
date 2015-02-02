require 'RMagick'

describe "Example" do
	context "with stub data" do
		it "does some very predicatable stuff" do |example|
			test_dir = "./example/with-stub-data/stats/"

			correct = Magick::Image.read(test_dir + "correct.png").first
			regression = Magick::Image.read(test_dir + "regression.png").first
			
			difference = correct <=> regression
			
			expect(difference).to eq(0)
		end
	end
end