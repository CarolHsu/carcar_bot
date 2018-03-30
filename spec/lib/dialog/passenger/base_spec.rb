require 'rails_helper'
require 'dialog/passenger/base'
require 'dialog/passenger/profile'

describe Dialog::Passenger::Base do

  let(:passenger) { create(:passenger) }
  let(:message) { "乘客資訊" }
  let(:dialog_type) { "profile" }

  subject { Dialog::Passenger::Base.new(passenger, message) }

  describe '#initialize' do

    before :each do
      allow(subject).to receive(:get_dialog_type)
      subject.instance_variable_set(:@dialog_type, dialog_type)
    end

    it 'should have @message' do
      expect(subject.instance_variable_get(:@message)).to eq(message)
    end

    it 'should have @Passenger' do
      expect(subject.instance_variable_get(:@passenger)).to eq(passenger)
    end
  end

  describe '#start' do

    it 'should call Dialog::Passenger::Profile if dialog type is profile' do
      allow_any_instance_of(Dialog::Passenger::Profile).to receive(:start).with(message)
      expect_any_instance_of(Dialog::Passenger::Profile).to receive(:start).with(message)
      subject.send(:start)
    end

  end

  describe '#get_dialog_type' do

    it 'should get @dialog_type from the settings of passenger' do
      passenger.settings.dialog_type = dialog_type
      subject.send(:get_dialog_type)
      expect(subject.instance_variable_get(:@dialog_type)).to eq(dialog_type)
    end
    
  end

  describe '#set_dialog_type' do
    
    context 'when message match keywords' do

      let(:airpost_message) { "機場叫車" }
      subject { Dialog::Passenger::Base.new(passenger, airpost_message) }

      before :each do
        subject.instance_variable_set(:@message, message)
      end

      it 'should set @dialog_type of keyword' do
        subject.send(:set_dialog_type)
        expect(subject.instance_variable_get(:@dialog_type)).to eq("airport")
      end

      it 'should set passenger.settings.dialog_type as @dialog_type' do
        subject.send(:set_dialog_type)
        setting = passenger.settings.dialog_type
        expect(setting).to eq("airport")
      end
      
    end
    
  end

end
