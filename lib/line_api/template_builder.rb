module LineAPI
  class TemplateBuilder
    attr_reader :type, :content

    BASIC_LAYOUT = {
      type: "template",
      template: {}
    }

    def initialize(type, content)
      @type = type
      @content = content
    end

    def build
      send("create_#{@type}")
    end

    private

    def create_buttons
      content_with_type = @content.merge({type: 'buttons'})
      layout = BASIC_LAYOUT.merge({template: content_with_type})
      layout
    end

    def create_confirm
      content_with_type = @content.merge({type: 'confirm'})
      layout = BASIC_LAYOUT.merge({template: content_with_type})
      layout
    end
      
  end
end
