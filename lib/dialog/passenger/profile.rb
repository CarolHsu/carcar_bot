require 'line_api/template_builder'
module Dialog
  module Passenger
    class Profile < Base
      DIALOGS = SCRIPT["profile"]
      PROCESSES = DIALOGS.keys

      def self.start
        begin
          handle_message
          get_current_dialog
          log_dialog_process
          response
        rescue
          {
            'type': 'text',
            'text': "我聽不懂您說的話 :)"
          }
        end
      end

      private
      def handle_message
        attr = @passenger.settings.dialog_process.to_sym
        ActiveRecord::Base.transaction do
          @passenger.update!(attr => @message)
        end
      end

      def get_current_dialog
        @current_dialog = @passenger.settings.previous_dialog ? PROCESSES[(PROCESSES.index(@passenger.settings.previous_dialog) + 1)] : PROCESSES[0] 
      end

      def log_dialog_process
        @passenger.settings.dialog_process = @current_dialog
      end

      def response
        dialog = DIALOGS[@current_dialog]
        type = dialog["type"]
        case type
        when "text"
          {
            type: type,
            text: dialog["text"]
          }
        else
          LineAPI::TemplateBuilder.new(dialog).build
        end
      end
    end
  end
end
