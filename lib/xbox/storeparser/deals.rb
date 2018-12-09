module Xbox
  module Storeparser
    class Deals
      attr_accessor :locale, :current_page, :deals

      def initialize(options={})
        @locale = options.fetch(:locale, "en-US")
        @deals  = []
      end

      def fetch
        fetcher = Fetcher.new(locale: locale)
        @deals = fetcher.call
      end
    end
  end
end
