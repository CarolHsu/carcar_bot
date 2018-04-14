class Passenger < ApplicationRecord
  include RailsSettings::Extend
  include AASM

  aasm do
    state :inactive, initial: true
    state :active
    event :register do
      transitions from: :inactive, to: :active do
        after do
          self.is_active = true
          self.save
        end
      end
    end
  end

end
