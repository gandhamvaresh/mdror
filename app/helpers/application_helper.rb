module ApplicationHelper
  def check_box_for_display(attribute, checked, label)
    check_box_tag(attribute, 1, checked, :disabled => true) + "&nbsp;<span style=\"#{'text-decoration:underline; font-weight:bold;' if checked}\">#{label}</span>".html_safe
  end
  
  def arrow_for_value(value)
    case value
    when 0
      '&nbsp;'.html_safe
    when 1
      '&uarr;'.html_safe
    when 2
      '&darr;'.html_safe
    else 
      '&nbsp;'.html_safe
    end
  end
end
