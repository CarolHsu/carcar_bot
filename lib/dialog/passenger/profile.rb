module Dialog
  module Passenger
    class Profile
      SCRIPT = YAML.load_file("#{Rails.root}/lib/dialog/scripts.yml")[:passenger][:call]
      include AASM

      aasm do
        state :join, initial: true
        state :name
        state :mobile
        state :email
      end

      event :ask_name do
        transitions from: :join, to: :name
      end

      event :ask_mobile do
        transitions from: :name, to: :mobile
      end

      event :ask_email do
        transitions from: :phone_number, to: :email
      end

      def initialize
        # @properties = {}
      end

      def start
        # pending
        read_script
      end

      private
      def read_script
        
      end

      def set_line_user_id
        
      end

      def set_line_user_name
        
      end

      def set_user_email
        
      end

      def set_user_mobile
        
      end

      def retrieve_user
        
      end
    end
  end
end
