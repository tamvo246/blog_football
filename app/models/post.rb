require 'nokogiri'

class Post < ApplicationRecord
  belongs_to :category

  validates :slug, uniqueness: true

  def show_random_image
  doc = Nokogiri::HTML.parse(self.content)
  image_urls = doc.css('img').map { |img| img['src'] }
  image_url = image_urls.present? ? image_urls[0] : 'uploads/banner-breadcrumb.jpg'
  end
end
