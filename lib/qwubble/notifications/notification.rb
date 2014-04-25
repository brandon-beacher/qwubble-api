module Qwubble
  module Notifications
    class Notification

      def data
        raise NotImplementedError
      end

      def notify(registration_ids = nil)
        GCM.deliver( notification(registration_ids) ) do |response|
          return response
        end
      end

      def notification(registration_ids = nil)
        {
          registration_ids: registration_ids || default_registration_ids,
          data: {
            qwubble: data
          }
        }
      end

      def default_registration_ids
        Qwubble::Models::Registration.select_map(:registration_id)
      end

    end
  end
end
