module ApplicationHelper

  def kramdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end
  
end
