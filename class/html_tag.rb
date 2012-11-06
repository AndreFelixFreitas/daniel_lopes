# encoding; utf-8

class HTMLTag

  def initialize(name, content, properties = {})
    @name       = name
    @content    = content
    @properties = properties
  end

  def to_s
    render
  end

  def render
    "<#{ @name } #{ render_properties }> #{ @content } </#{ @name }>"
  end

  def render_properties
    @properties.collect { |k, v| "#{ k } = '#{ v }'" }.join(" ")
  end

end

tag = HTMLTag.new "p", "My content", {class: "Title", id: "Title"}
puts tag