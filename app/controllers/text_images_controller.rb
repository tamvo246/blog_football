class TextImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if params[:file].class == ActionDispatch::Http::UploadedFile
      uploaded_file = params[:file]
      FileUtils.mkdir_p(Rails.root.join('public', 'uploads'))
      FileUtils.cp uploaded_file.tempfile, Rails.root.join('public', 'uploads', uploaded_file.original_filename)

      respond_to do |format|
        # if @image.save
          format.json { render json: { "location": url_for("/uploads/#{uploaded_file.original_filename}") }.to_json, status: :ok }
        # else
        #   format.json { render json: @image.errors, status: :unprocessable_entity }
        # end
      end
    end
  end
end
