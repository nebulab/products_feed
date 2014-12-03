ProductsFeed
=================

Generates a feed of your products, suitable for ecommerce aggregator service.
It actually supports:

* Google Merchant

more to come...

Installation
------------

Add products_feed to your Gemfile:

```ruby
gem 'products_feed'
```

Usage
-----

First of all, create a new instance of `ProductsFeed::GoogleMerchant::Feed`.


```ruby

google_merchant = ProductsFeed::GoogleMerchant::Feed.new(items, output, options)

google_merchant.generate do |xml, item|
  # mandatory fields. if something is missing it will raise an excption
  xml.field 'g:id', item[:id]
  xml.field 'g:title', item[:name]
  xml.field 'g:description', item[:description]
  xml.field 'g:link', item[:link]
  xml.field 'g:image_link', item[:image_link]
  xml.field 'g:condition', 'new' # 'new' 'used' 'refurbished'
  xml.field 'g:availability', 'in stock' #'in stock' 'out of stock' 'preorder'
  xml.field 'g:price', "#{item[:price]} USD"
  xml.field 'g:brand', item[:brand] # Brand of the item
  xml.field 'g:gtin', item[:gtin] # Global Trade Item Numbers
  xml.field 'g:mpn', item[:mpn] # Manufacturer Part Number

  # optional fields
  xml.field 'g:item_group_id', 'GROUP_ID'
  xml.field 'g:google_product_category', 'Software > Digital Goods & Currency'
  xml.field 'g:product_type', 'PRODUCT_TYPE'
end
```


Testing
-------

First bundle your dependencies, then run `rake`.

```shell
bundle
bundle exec rake
```

```ruby
require 'products_feed/factories'
```

Copyright (c) 2014 [Nebulab](http://nebulab.it), released under the New BSD License
