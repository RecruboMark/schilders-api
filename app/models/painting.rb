class Painting < ApplicationRecord
  has_one_attached :image

  def image_url
    Rails.application.routes.url_helpers.url_for(ActiveStorage::Attachment.first)
  end
end
