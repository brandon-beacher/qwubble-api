require 'spec_helper'

describe Qwubble::Resources::Registrations do
  it "registers a device" do
    with_api Qwubble::Goliath do
      post_request(path: "/api/registrations", body: { registration_id: "josh is awesome" }) do |async|
        async.response.should == { registration_id: "josh is awesome" }.to_json
      end
    end
  end
end
