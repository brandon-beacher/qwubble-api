module Qwubble
  module Notifications
    class AnswerCreationNotification < Notification

      def initialize(answer)
        @answer = answer
      end

      def data
        {
          type: "answer_creation_notification",
          answer: @answer
        }
      end
    end
  end
end
