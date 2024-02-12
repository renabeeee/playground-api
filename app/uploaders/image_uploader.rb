class ImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  uploader = AvatarUploader.new

uploader.store!(my_file)

uploader.retrieve_from_store!('my_file.png')

end
