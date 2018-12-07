module Xbox
  module Storeparser
    class Deals
      attr_accessor :locale, :current_page, :deals
      BASE_URI = "https://www.storeparser.com//xbox-one/deals/"

      def initialize(options={})
        @locale = options.fetch(:locale, "en-US")
        @current_page = 1
        @deals = []
      end

      def fetch
      end
    end
  end
end
