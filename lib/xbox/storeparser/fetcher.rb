module Xbox
  module Storeparser
    class Fetcher
      BASE_URI = "https://www.storeparser.com"

      attr_accessor :deal, :curr_page, :max_page, :locale

      def initialize(options={})
        @locale    = options.fetch(:locale)
        @curr_page = options.fetch(:curr_page, 1)
        @max_page  = options.fetch(:max_page, 2)
      end

      def get_url(curr_page=1)
        page = (curr_page.nil? || curr_page == 1) ? "" : "page-#{curr_page}"

        "#{BASE_URI}/#{locale}/xbox/deals/#{page}"
      end

      def call
        while curr_page <= max_page
          page = Page.new(get_url(curr_page))
        end

        return deals
      end
    end
  end
end
