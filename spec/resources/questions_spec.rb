require 'spec_helper'

describe Qwubble::Resources::Questions do
  it "asks a question" do
    with_api Qwubble::Goliath do
      post_request(
        path: "/api/questions",
        body: {
          registration_id: "josh is awesome",
          question: "Should I wear a chicken suit to work?" }) do |async|
        expect(
          Qwubble::Models::Question.first!(
            registration_id: "josh is awesome").exists?).to be_true
      end
    end
  end
end
