module ApplicationHelper
  FLASH_TYPES = { 'success' => 'alert-success', 'error' => 'alert-danger', 'alert' => 'alert-warning', 'notice' => 'alert-info' }.freeze

  def cart_quantity
    current_cart.line_items.sum(:quantity)
  end

  def select_type_options
    Product.distinct.pluck(:type).insert(0, 'All')
  end

  def checkout_disabled?
    cart_quantity.zero? ? 'true' : 'false'
  end

  def bootstrap_class_for(flash_type)
    FLASH_TYPES[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do 
          concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
          concat message
        end
      )
    end
    nil
  end
end
