require 'nokogiri'

# Custom matcher for xml using Nokogiri CSS selector
#
# Usage: expect(doc.body).to have_xml 'sometag', 'content inside selector'

RSpec::Matchers.define :have_xml do |selector, text|
  match do |body|
    doc = Nokogiri::XML(body)
    nodes = doc.search(selector)
    expect(nodes).to_not be_empty

    if text
      nodes.each do |node|
        expect(node.content).to eq(text)
      end
    end
    true
  end

  failure_message do |body|
    "expected to find xml tag '#{selector}' in:\n#{body}"
  end

  failure_message_when_negated do |body|
    "expected not to find xml tag '#{selector}' in:\n#{body}"
  end

  description do
    "have xml tag '#{selector}'"
  end
end
