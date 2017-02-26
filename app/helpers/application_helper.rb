module ApplicationHelper
  # Define title of page, must assert <% provide(:title, "Home") %> in all views
  def full_title(page_title = '')
    base_title = 'Docnect'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def search_placeholder
    case current_user.user_group
      when 1
        'Search Doctors'
      when 2
        'Search Patients'
      else
        'Search Users'
    end
  end
end
