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

First of all, create a new instance of `ProductsFeed::GoogleMerchant::Feed`. It
accepts the following parameters:

* `items`: an `Enumerable` object (eg: an `Array` or an `ActiveRecord` named scope
* `output`: an `IO` object (eg: a `File` or a `Buffer`)
* `options`: an `Hash` with `title`,`description` and `link` keys to represent site infos


```ruby

google_merchant = ProductsFeed::GoogleMerchant::Feed.new(items, output, options)
```

Then call `#generate` method and pass it a block. The block will iterate your items

```ruby```
google_merchant.generate do |doc, item|
  # mandatory fields. if something is missing it will raise an excption
  doc.field 'g:id', item[:id]
  doc.field 'g:title', item[:name]
  doc.field 'g:description', item[:description]
  doc.field 'g:link', item[:link]
  doc.field 'g:image_link', item[:image_link]
  doc.field 'g:condition', 'new' # 'new' 'used' 'refurbished'
  doc.field 'g:availability', 'in stock' #'in stock' 'out of stock' 'preorder'
  doc.field 'g:price', "#{item[:price]} USD"
  doc.field 'g:brand', item[:brand] # Brand of the item
  doc.field 'g:gtin', item[:gtin] # Global Trade Item Numbers
  doc.field 'g:mpn', item[:mpn] # Manufacturer Part Number

  # optional fields
  doc.field 'g:item_group_id', 'GROUP_ID'
  doc.field 'g:google_product_category', 'Software > Digital Goods & Currency'
  doc.field 'g:product_type', 'PRODUCT_TYPE'
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
