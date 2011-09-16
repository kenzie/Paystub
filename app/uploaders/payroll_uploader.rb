# encoding: utf-8

class PayrollUploader < CarrierWave::Uploader::Base

  storage :file
  # storage :fog

  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def extension_white_list
    %w(xml)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{model.user.id}/#{model.id}.#{file.extension}" if original_filename
  end

end
