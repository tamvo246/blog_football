class AboutsController < ApplicationController
  def show
    @abouts = About.all.order(:created_at)
    @about = About.find_by(slug: params[:slug])
  end
end
