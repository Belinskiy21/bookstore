class ImagesUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumb do
    process resize_to_limit: [160, 170]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
