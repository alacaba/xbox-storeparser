module Xbox
  module Storeparser
    class Item
      attr_accessor :item, :content

      def initialize(item)
        @item = item
      end

      def content
        discount_section = item.css('.sp_offer')
        @content ||= discount_section.children.map { |c| c.to_s }
      end

      def discount
        content[2]
      end

      def price
        content[0]
      end
    end
  end
end
