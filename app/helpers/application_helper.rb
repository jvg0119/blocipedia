module ApplicationHelper

	def flash_class(type)
    case type
      when "success" then "alert alert-success" # green
      when "info" then "alert alert-info"       # blue
      when "notice" then "alert alert-info"     # blue
      when "warning" then "alert alert-warning" # yellow
      when "alert" then "alert alert-warning"   # yellow
      when "danger" then "alert alert-danger"   # red
      when "error" then "alert alert-danger"    # red
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, prettify: true)
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end 

  def markdown_to_html_test(markdown)  # not used
    Markdown.new(markdown).to_html.html_safe
  end 

end

