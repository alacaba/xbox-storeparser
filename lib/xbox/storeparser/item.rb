module Xbox
  module Storeparser
    class Item
      attr_accessor :item, :price, :box_art, :title, :discount,
        :boxart_section, :price_section, :amount, :currency

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
        @discount ||= price_section[2]
      end

      def price
        @price ||= price_section[0]
      end

      def amount
        @amount ||= price.split[1].to_f
      end

      def currency
        @currency ||= price.split[0]
      end

      def box_art
        @box_art ||= boxart_section["src"].value
      end

      def title
        @title ||= boxart_section["alt"].value
      end

      def details
        {
          title: title,
          discount: discount,
          box_art: box_art,
          amount: amount,
          currency: currency,
        }
      end
    end
  end
end
