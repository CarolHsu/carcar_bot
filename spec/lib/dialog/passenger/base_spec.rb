require 'spec_helper'
require 'dialog/passenger/base'
require 'dialog/passenger/profile'

describe Dialog::Passenger::Base do
  describe '#initialize' do
    it 'should have @dialog_type which is capitalized' do
      subject = Dialog::Passenger::Base.new("profile")
      expect(subject.instance_variable_get(:@dialog_type)).to eq("profile")
    end
  end

  describe '#start' do
    it 'should call Dialog::Passenger::Profile if dialog type is profile' do
      subject = Dialog::Passenger::Base.new("Profile")
      dialog = Dialog::Passenger::Profile
      allow(dialog).to receive(:start).with(nil)
      expect(dialog).to receive(:start).with(nil)
      subject.start(nil)
    end
  end
end
