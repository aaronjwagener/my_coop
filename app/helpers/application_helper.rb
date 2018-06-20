module ApplicationHelper

  # Generates a full title for pages
  # Default: base_title
  def full_title(page_title = '')
    base_title = "Base App"    # Base Title here
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
