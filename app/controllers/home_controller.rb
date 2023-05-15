class HomeController < ApplicationController
  def index
    @about = About.first

    @post = Post.last

  end
end
