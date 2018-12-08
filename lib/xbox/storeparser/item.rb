module Xbox
  module Storeparser
    class Item
      attr_accessor :item, :price_section

      def initialize(item)
        @item = item
      end

      def price_section
        section = item.css('.sp_offer')
        @price_section ||= section.children.map { |c| c.to_s }
      end

      def boxart_section
        ba = item.at_css('.sp_boxart')
        @boxart_section ||= ba.attributes
      end

      def discount
        price_section[2]
      end

      def price
        price_section[0]
      end

      def box_art
        boxart_section["src"].value
      end

      def title
        boxart_section["alt"].value
      end
    end
  end
end
