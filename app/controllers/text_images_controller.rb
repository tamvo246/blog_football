require 'aws-sdk-s3'
class TextImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if params[:file].class == ActionDispatch::Http::UploadedFile
      # uploaded_file = params[:file]
      # FileUtils.mkdir_p(Rails.root.join('public', 'uploads'))
      # FileUtils.cp uploaded_file.tempfile, Rails.root.join('public', 'uploads', uploaded_file.original_filename)

      uploaded_file = params[:file]
      s3_url = upload_to_s3(uploaded_file)

      respond_to do |format|
        format.json { render json: { "location": s3_url }.to_json, status: :ok }
        end
      end
  end

  def upload_to_s3(file)
    s3 = Aws::S3::Resource.new(
      credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
      region: ENV['AWS_REGION']
    )

    bucket = s3.bucket(ENV['S3_BUCKET_NAME'])

    folder = 'uploads'
    object_key = File.join(folder, file.original_filename)
    obj = bucket.object(object_key)
    obj.upload_file(file.tempfile.path, acl: 'public-read')

    obj.public_url
  end
end
