module ApplicationHelper

  # Returns the full title on a per-page basis.
  # if no page title is defined, and adds a vertical
  # bar followed by the page title if one is defined
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
