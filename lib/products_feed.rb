module ProductsFeed
  class MissingMandatoryParamError < StandardError ; end

  autoload :S3Uploader, File.join(File.dirname(__FILE__), 's3_uploader')

  module GoogleMerchant
    autoload :Feed, File.join(File.dirname(__FILE__), 'google_merchant/feed')
  end
end
