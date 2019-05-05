# frozen_string_literal: true

# Testing setup
if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end

# Production setup with Amazon Web Services
if ENV["AWS"]
  CarrierWave.configure do |config|
    config.storage    = :aws
    config.aws_bucket = ENV["S3_BUCKET_NAME"]
    config.aws_acl    = "public-read"

    # The maximum period for authenticated_urls is only 7 days.
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    # Set custom options such as cache control to leverage browser caching
    config.aws_attributes = {
      expires: 1.week.from_now.httpdate,
      cache_control: "max-age=604800",
    }

    config.aws_credentials = {
      access_key_id: ENV["S3_ACCESS_KEY"],
      secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
      region: ENV["S3_AWS_REGION"], # Required
    }
  end
end
