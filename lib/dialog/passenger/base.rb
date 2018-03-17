module Dialog
  module Passenger
    class Base

      KEYWORDS = {}
      
      def initialize(passenger, message)
        @message = message
        @passenger = passenger
        get_dialog_type
        set_dialog_type unless @dialog_type
        self.start
      end

      def start
        dialog = eval("Dialog::Passenger::#{@dialog_type}")
        dialog.start(@message)
      end

      private

      def get_dialog_type
        @dialog_type = @passenger.settings.dialog_type
      end

      def set_dialog_type
        unless KEYWORDS[@message].nil?
          @dialog_type = KEYWORDS[@message]
          @passenger.settings.dialog_type = KEYWORDS[@message]
        else
          @dialog_type = "profile"
          @passenger.settings.dialog_type = "profile"
        end
      end

    end
  end
end
