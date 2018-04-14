module Dialog
  module Passenger
    class Base

      KEYWORDS = {
        "乘客資訊": "profile",
        "機場叫車": "airport"
      }
      
      def initialize(passenger, message)
        @passenger = passenger
        @message = message
        get_current_dialog_type
        set_dialog_type unless @dialog_type
      end

      def start
        dialog = "Dialog::Passenger::#{@dialog_type.capitalize}".constantize.new
        dialog.start(@message)
      end

      private

      def get_current_dialog_type
        @dialog_type = @passenger.settings.dialog_type
      end

      def set_dialog_type
        keyword = KEYWORDS[@message.to_sym]
      transitions from: :no_name, to: :ready
        unless keyword.nil?
          @dialog_type = keyword
          @passenger.settings.dialog_type = keyword
        else
          @dialog_type = "profile"
          @passenger.settings.dialog_type = "profile"
        end
      end

    end
  end
end
