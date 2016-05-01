module ApplicationHelper
  def list_item_to_active(name, path, options={})
    options[:class_active_if_pages] ||= [path]
    active_content_tag :li, options do
      link_to name, path
    end
  end

  def active_content_tag(el, options={})
    options = {
      class_active_if_pages: [],
      class_active_if_controller: [],
      class: '',
    }.merge(options)

    if current_pages?(options[:class_active_if_pages]) || current_controllers?(options[:class_active_if_controller])
      options[:class] = append_or_replace_string(options[:class], 'active')
    end

    options.delete(:class_active_if_pages)
    options.delete(:class_active_if_controller)
    content_tag el, capture {yield}, options
  end

  def current_pages?(paths)
    paths.any?{ |path| current_page?(path) }
  end

  def current_controllers?(controllers)
    controllers.include?(params[:controller])
  end

  def append_or_replace_string(target_str, replace_with_str)
    target_str.sub(/active|$/, " #{replace_with_str}")
  end

  def job_order_link(job_order, options={})
    link_to job_order.code, job_order, options
  end

  def name_link(object_with_name, options={})
    return "- - -" unless object_with_name.present?
    link_to object_with_name.name, object_with_name, options
  end

  def number_to_currency(amount, options={})
    unit = "&#8369; "
    return "#{unit} - - -".html_safe unless amount.present?
    defaults = {
      precision: 2,
      unit: unit.html_safe
    }
    super(amount, defaults.merge(options))
  end

  def show_action_panel
    if (action_panel_items  = yield :action_panel_items).present?
      action_panel_items
    end
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