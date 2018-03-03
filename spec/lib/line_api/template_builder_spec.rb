require 'spec_helper'
require 'line_api/template_builder'

describe LineAPI::TemplateBuilder do

  before(:each) do
    @content = {
      actions: [
        {
          "type": "message",
          "label": "test",
          "text": "test"
        }
      ],
      title: "test",
      text: "test"
    }
  end

  describe 'build_buttons_template' do

    before :each do
      @type = 'buttons'
      @return_value = {
        "type": "template",
        "template": {
          "type": "buttons",
          "actions": @content[:actions],
          "title": @content[:title],
          "text": @content[:text]
        }
      }
    end

    it '#build' do
      subject = LineAPI::TemplateBuilder.new(@type, @content)
      expect(subject).to receive(:send).with("create_buttons")
      subject.build
    end

    it '#create_buttons' do
      builder = LineAPI::TemplateBuilder.new(@type, @content)
      template = builder.send(:create_buttons)
      expect(template).to eq(@return_value)
    end

  end

  describe 'build_confirm_template' do

    before :each do
      @type = 'confirm'
      @return_value = {
        "type": "template",
        "template": {
          "type": "confirm",
          "actions": @content[:actions],
          "title": @content[:title],
          "text": @content[:text]
        }
      }
    end

    it '#build' do
      subject = LineAPI::TemplateBuilder.new(@type, @content)
      expect(subject).to receive(:send).with("create_confirm")
      subject.build
    end

    it '#create_confirm' do
      builder = LineAPI::TemplateBuilder.new(@type, @content)
      template = builder.send(:create_confirm)
      expect(template).to eq(@return_value)
    end
    
  end
end
