require 'aasm'

module Dialog
  module Passenger
    class Profile
      # SCRIPT = YAML.load_file("#{Rails.root}/lib/dialog/scripts.yml")[:passenger][:call]
      include AASM

      aasm do
        state :name, initial: true
        state :mobile
        state :email
      end

      def self.start(event)
        # pending
        read_script
      end

      private
      def read_script
        
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
