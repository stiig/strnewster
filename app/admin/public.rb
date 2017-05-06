# frozen_string_literal: true

ActiveAdmin.register Public do
  permit_params :title, :outer_id, :mode, :wide, :width, :height

  index do
    selectable_column
    column :id do |public|
      link_to public.id, admin_public_path(public)
    end
    column :title
    column :outer_id do |public|
      link_to(*(["https://vk.com/public#{public.outer_id}"] * 2), target: '_blank')
    end
    actions dropdown: true
  end

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
