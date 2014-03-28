module ApplicationHelper
  def font_icon(icon, size='lg')
    return "" unless icon
    "<i class=\"fa fa-#{icon} #{'fa-' + size}\"></i>".html_safe
  end
  
  def slide_link(text, target, css = '', title: '')
    link_to text, "javascript:;", class: "slide-to #{css}", data: { target: target }
  end
  
  def round_link(text, icon, target: nil, link: nil, css: '', title: '')
    css = "#{css} round-link"
    text = "#{text} #{font_icon(icon)}".html_safe
    if target
      slide_link text, target, css, title: title
    elsif link
      link_to text, link, class: css, target: '_blank', title: title
    end    
  end
  
  def round_link_for(link, css: '', show_name: true)
    round_link (show_name ? link.name : ''), link.icon, link: link.href, css: css, title: (show_name ? '' : link.name) if link.present?
  end
  
end
