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
  
  def organic_options_for_select(include_price: false)
    x = [
      [t(:non_organic), false],
      [t(:organic), true]
    ]
    if include_price
      x[0][0] += " - £#{price_string(1, false)} per month"
      x[1][0] += " - £#{price_string(1, true)} per month"
    end
    x
  end

end
