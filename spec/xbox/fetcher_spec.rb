RSpec.describe Xbox::Storeparser::Fetcher do
  let(:locale) { 'en-US' }
  let(:fetcher) { described_class.new(locale: locale) }

  describe "#get_url" do
    it "returns the url based on locale" do
      expect(fetcher.get_url).to eq "#{described_class::BASE_URI}/#{locale}/xbox/deals/"
    end

    it "returns the url based on current page" do
      expect(fetcher.get_url(2)).to eq "#{described_class::BASE_URI}/#{locale}/xbox/deals/page-2"
    end
  end
end
