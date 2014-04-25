require 'spec_helper'

describe Qwubble::Resources::Registrations do
  it "registers a device" do
    with_api Qwubble::Goliath do
      post_request(
        path: "/api/registrations",
        body: { registration_id: "josh is awesome" }) do |async|
        expect(
          Qwubble::Models::Registration.first(
            registration_id: "josh is awesome").exists?).to be_true
      end
    end
  end
end
