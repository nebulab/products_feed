# require 'spree_core'
# require 'spree_products_feed/engine'

module SpreeProductsFeed
  module GoogleMerchant
    # autoload :Feed, './google_merchant/feed'

    autoload :Feed, File.join(File.dirname(__FILE__), 'google_merchant/feed')
  end
end
