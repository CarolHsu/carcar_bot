class Passenger < ApplicationRecord
  include RailsSettings::Extend
  include AASM

  aasm do
    state :inactive, initial: true
    state :no_name
    state :ready

    event :get_phone do
      transitions from: :inactive, to: :no_name
    end

    event :get_name do
      transitions from: :no_name, to: :ready
    end
  end
end
