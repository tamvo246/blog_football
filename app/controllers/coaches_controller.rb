class CoachesController < ApplicationController
  def show
    @coach = Coach.find(params[:id])

    set_meta_tags(
      title: @coach.name + " | " + 'Bóng đá cộng đồng',
      description: 'Bóng đá cộng đồng',
      keywords: 'product, category, keywords',
      author: 'Your Name',
      og: {
        title: @coach.name.truncate_words(10, omission: '...'),
        description: @coach.name.truncate_words(10, omission: '...'),
        image: @coach.avatar.url
      }
    )
  end
end
