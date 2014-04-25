require 'spec_helper'

describe Qwubble::Notifications::QuestionCreationNotification do
  it "notifies when a question is asked" do
    EM.synchrony do
      question = Qwubble::Models::Question.new(question: "Should I wear a chicken suit to work?")
      question_creation_notification = Qwubble::Notifications::QuestionCreationNotification.new(question)
      gcm_response = question_creation_notification.notify([ENV['GCM_TEST_REGISTRATION_ID']])
      expect(gcm_response.result["success"]).to eq(1)
      EM.stop
    end
  end
end
