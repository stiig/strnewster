# frozen_string_literal: true

ActiveAdmin.register Public do
  permit_params :title, :outer_id, :mode, :wide, :width, :height

  form do |_f|
    inputs do
      input :title
      input :outer_id, required: true
      input :mode
      input :wide
      input :width
      input :height
    end
    actions
  end
end
