require 'spec_helper'

describe Qwubble::Resources::Answers do
  it "answers a question" do
    with_api Qwubble::Goliath do
      post_request(
        path: "/api/answers",
        body: {
          registration_id: "josh is awesome",
          question_id: 666,
          answer: "You should wear a chicken suit to work." }) do |async|
        expect(
          Qwubble::Models::Answer.first!(
            registration_id: "josh is awesome").exists?).to be_true
      end
    end
  end

  it "gets the answers to a question" do
    with_api Qwubble::Goliath do
      question = Qwubble::Models::Question.create(
        registration_id: "josh is awesome",
        question: "What is this song about?",
        image_url: "http://res.cloudinary.com/big-nerd-ranch/image/upload/v1398461928/varying_qubbles_kyc5bb.png")
      question.add_answer(
        registration_id: "bill is awesome too",
        answer: "It's about the struggle of manatees in the modern world.",
        image_url: "http://res.cloudinary.com/big-nerd-ranch/image/upload/v1398461928/varying_qubbles_kyc5bb.png")
      get_request(
        path: "/api/answers",
        body: {
          question_id: question.id }) do |async|
        answers = MultiJson.load(async.response)
        expect(answers.first["question_id"]).to eq(question.id)
      end
    end
  end
end
