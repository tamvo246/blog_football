class AboutsController < ApplicationController
  def show
    @about = About.find_by(slug: params[:slug])
  end
end
