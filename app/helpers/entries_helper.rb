module EntriesHelper

  def entries_list(title, content)
    return if @visible.fetch(content, '').blank?
    
    concat content_tag :h2, link_to(title, 'javascript:;')
    render partial: "partials/entries", locals: { type: content }
  end
  
  def new_entry_path(entry, params={})
    send "new_#{sanitize(entry.type).to_s.downcase}_path", params
  end
  
  def edit_entry_path(entry, params={})
    send "edit_#{sanitize(entry.type).to_s.downcase}_path", entry, params
  end
  
  def entries_path(type, params={})
    send "#{type.to_s.downcase.pluralize}_path", params
  end
  
  def entry_path(entry, params={})
    send "#{sanitize(entry.type).to_s.downcase}_path", entry, params
  end
  
  def entry_title_link(type)
    content_tag :h2, link_to(type.to_s.humanize.pluralize, entries_path(type)), class: "#{'selected' if type.to_s == @type.to_s}"
  end
  
  private
  
  def sanitize(type)  
    type == 'GigEntry' ? 'gig_entry' : type
  end
  
end
