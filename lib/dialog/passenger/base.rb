module Dialog
  module Passenger
    class Base
      
      def initialize(dialog_type)
        @dialog_type = dialog_type
      end

      def start(event)
        dialog = eval("Dialog::Passenger::#{@dialog_type}")
        dialog.start(event)
      end

    end
  end
end
