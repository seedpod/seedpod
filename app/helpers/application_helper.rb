module ApplicationHelper

  def kramdown(text)
    Kramdown::Document.new(text).to_html.html_safe
  end

  def error_messages_for(object)
    return nil if object.errors.messages.empty?
    content_tag(:div, class: 'alert alert-danger') do
      content_tag(:ul) do
        object.errors.full_messages.map{|x| content_tag :li, x}.join.html_safe
      end
    end
  end
  
  def organic_options_for_select
    x = [
      [t(:organic), true],
      [t(:non_organic), false]
    ]
  end

  def size_options_for_select
    x = [
      [t(:small), "small"],
      [t(:medium), "medium"],
    ]
  end
  
end
