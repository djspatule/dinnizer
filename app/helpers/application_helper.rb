module ApplicationHelper
  def cloudinary_configured?
    defined?(Cloudinary) && Cloudinary.config.cloud_name.present?
  end
end
