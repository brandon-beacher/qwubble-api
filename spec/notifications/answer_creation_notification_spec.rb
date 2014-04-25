require 'spec_helper'

describe Qwubble::Notifications::AnswerCreationNotification do
  it "notifies when a question is answered" do
    EM.synchrony do
      answer = Qwubble::Models::Answer.new(answer: "You should wear a chicken suit to work.")
      answer_creation_notification = Qwubble::Notifications::AnswerCreationNotification.new(answer)
      gcm_response = answer_creation_notification.notify([ENV['GCM_TEST_REGISTRATION_ID']])
      expect(gcm_response.result["success"]).to eq(1)
      EM.stop
    end
  end
end
