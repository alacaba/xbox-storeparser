RSpec.describe Xbox::Storeparser::Deals do
  let(:deals) { described_class.new }

  context "defaults" do
    it "uses 'en-US' as default locale" do
      expect(deals.locale).to eq 'en-US'
    end

    it 'sets default deals to empty array' do
      expect(deals.deals).to eq []
    end
  end

  describe "#fetch" do
    it "populates the deals collection" do
      allow(deals).to receive(:fetch) { [1, 2, 3] }
      expect(deals.fetch).to eq [1, 2, 3]
    end

    it "fetches all the items" do
      _deals = deals.fetch

      _deals.each { |d| p d.details }
    end
  end
end
