module Qwubble
  module Notifications
    class QuestionCreationNotification < Notification

      def initialize(question)
        @question = question
      end

      def data
        {
          type: "question_creation_notification",
          question: @question
        }
      end
    end
  end
end
