require 'spec_helper'

describe Qwubble::Searches::GoogleImageSearch do
  it "grabs a random image url" do
    EM.synchrony do
      image_url = Qwubble::Searches::GoogleImageSearch.grab_random_image_url("Should I wear a chicken suit to work?")
      expect(image_url.class).to eq(String)
      EM.stop
    end
  end
end
