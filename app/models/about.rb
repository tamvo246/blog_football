class About < ApplicationRecord
  validates :slug, uniqueness: { message: "Liên kết này đã tồn tại" }
  mount_uploader :image_intro, ImageUploader

  def show_random_image
    doc = Nokogiri::HTML.parse(self.content)
    image_urls = doc.css('img').map { |img| img['src'] }
    image_url = image_urls.present? ? image_urls[0] : 'uploads/banner-breadcrumb.jpg'
  end

  def trick_content content
    content.include?("/uploads/") ? content : content.gsub('uploads/',"/uploads/")
  end
end
