# frozen_string_literal: true

module ApplicationHelper
  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }.freeze

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade show") do
        concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def form_errors(form, _show_field = true)
    return '' if form&.errors.blank?
    content_tag :div do
      concat(content_tag(:div, id: 'error_explanation') do
        content_tag :h2, 'Исправьте следующие ошибки перед сохранением:'
      end)
      concat(content_tag(:ul) do
        form.errors.full_messages.each do |msg|
          concat(content_tag(:li, msg))
        end
      end)
    end
  end
end
