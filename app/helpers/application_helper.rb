module ApplicationHelper
  def list_item_to_active(name, path, options={})
    active_class = current_page?(path) ? "active" : ''
    options[:class] ||= ''
    options[:class] += active_class
    content_tag :li, (link_to name, path), options
  end

  # def will_paginate(collection_or_options = nil, options = {})
  #   if collection_or_options.is_a? Hash
  #     options, collection_or_options = collection_or_options, nil
  #   end
  #   unless options[:renderer]
  #     options = options.merge :renderer => MyCustomLinkRenderer
  #   end
  #   super *[collection_or_options, options].compact
  # end
end