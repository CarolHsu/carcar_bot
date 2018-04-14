module LineAPI
  class TemplateBuilder
    attr_reader :content

    BASIC_LAYOUT = {
      type: "template",
      template: {}
    }

    DEFAULT_ACTIONS = {
      type: "confirm",
      text: nil,
      action: [
        {
          type: "message",
          label: "確認",
          text: "yes"
        },
        {
          type: "message",
          label: "算了",
          text: "no"
        }
      ]
    }

    def initialize(content, description=nil)
      @content = content.nil? ? DEFAULT_ACTIONS : content
      @content["text"] = description if description
    end

    def build
      create_template
    end

    private

    def create_template
      BASIC_LAYOUT.merge({template: @content})
    end

  end
end
