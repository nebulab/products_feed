module ProductsFeed
  class MissingMandatoryParamError < StandardError ; end

  module GoogleMerchant
    autoload :Feed, File.join(File.dirname(__FILE__), 'google_merchant/feed')
  end
end
