RSpec.describe Xbox::Storeparser::Deals do
  let(:deals) { described_class.new }

  context "defaults" do
    it "uses 'en-US' as default locale" do
      expect(deals.locale).to eq 'en-US'
    end

    it 'sets default current page to 1' do
      expect(deals.current_page).to eq 1
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
  end
end
