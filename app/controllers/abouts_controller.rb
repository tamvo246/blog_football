class AboutsController < ApplicationController
  def show
    @abouts = About.all
    @about = About.find_by(slug: params[:slug])
  end
end
