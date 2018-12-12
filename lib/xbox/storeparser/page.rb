module Xbox
  module Storeparser
    class Page
      attr_accessor :url, :doc, :items

      def initialize(url)
        @url = url
      end

      def doc
        @doc ||= Nokogiri::HTML(open(url))
      end

      def nav_wrapper
        @nav_wrapper ||= doc.at_css('ul#sp_pagination')
      end

      def nav_links
        @nav_links ||= nav_wrapper.css('li')
      end

      def items
        @items ||= doc.css('div.sp_product')
      end

      def max_page
        return 1 if doc.nil?
        matches = /[0-9]+/.match(nav_links.text)
        matches.to_s.split('').map(&:to_i).max
      end
    end
  end
end
