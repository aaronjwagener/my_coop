module ApplicationHelper

  # Generates a full title for pages
  # Default: base_title
  def full_title(page_title = '')
    base_title = "My Coop"    # Base Title here
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Generates a list of items, based on controller name
  # Example: model is User
  # If the controller action is #index, the partial is user/user
  # If the controller action is #members, the partial is user/member
  def render_list(items)
    if items.any?
      # find correct partial
      if controller.action_name == 'index'
        partial = controller.controller_name.downcase
      else
        partial = controller.action_name.singularize
      end
      # Render the list
      list_class = partial.pluralize
      content_tag :ul, class: list_class do
        render partial: controller_name + '/' + partial, collection: items
      end
    else
      content_tag :span, "There are no items to display"
    end
  end
end
