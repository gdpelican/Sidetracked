module EntriesHelper

  def entries_list(title, content)
    return if @visible.fetch(content, '').blank?
    
    concat content_tag :h2, link_to(title, 'javascript:;')
    render partial: "partials/entries", locals: { type: content }
  end
  
end
