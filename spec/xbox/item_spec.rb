RSpec.describe Xbox::Storeparser::Item do
  let(:path) { File.dirname(__FILE__) + '/../fixtures/index.html' }
  let(:page) { Xbox::Storeparser::Page.new(path) }
  let(:items) { page.items }

  describe "#price" do
    it "returns the item's price" do
      item = described_class.new(items.first)
      expect(item.price).to eq "GBP 13.99"
    end
  end

  describe "#discount" do
    it "returns the item's discount" do
      item = described_class.new(items.first)
      expect(item.discount).to eq "Save 30%"
    end
  end
end
