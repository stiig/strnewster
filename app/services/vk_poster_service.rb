# frozen_string_literal: true

class VkPosterService
  def initialize(post)
    @post = post
  end

  def call
    return unless post

    app = VK::Application.new(app_id: ENV['VK_APP_ID'], version: '3', access_token: ENV['VK_KEY'])
    begin
      photo_id = prepare_image(app, post.text)
      app.wall.post(owner_id: ENV['VK_GROUP_ID'], message: post.text, form_group: 0, attachments: photo_id)
      post.published!
    rescue VK::Error => e
      warn("VK not available or #{e.message}")
    end
  end

  private

  def prepare_image(app, text)
    group_id = ENV['VK_GROUP_ID'].to_i.abs

    image = ImageCreatorService.generate_image(text)
    image_io = StringIO.new(image)

    serv = app.photos.get_wall_upload_server(gid: group_id)

    updated = post_image(serv['upload_url'], image_io)
    photo = app.photos.save_wall_photo(server: updated[:server], hash: updated[:hash],
                                       photo: updated[:photo], gid: group_id)
    photo.first['id']
  end

  def post_image(raw_uri, image_io)
    uri = URI(raw_uri)

    conn = Faraday.new(uri) do |f|
      f.request :multipart
      f.request :url_encoded
      f.adapter :net_http
    end
    payload = { photo: Faraday::UploadIO.new(image_io, 'image/png', 'image.png') }
    data = conn.post(uri.path, payload)

    JSON.parse(data.body, symbolize_names: true)
  end

  attr_reader :post
end
