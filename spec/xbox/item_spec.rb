RSpec.describe Xbox::Storeparser::Item do
  let(:path) { File.dirname(__FILE__) + '/../fixtures/index.html' }
  let(:page) { Xbox::Storeparser::Page.new(path) }
  let(:items) { page.items }

  let(:item) { described_class.new(items.first) }

  describe "#price" do
    it "returns the item's price" do
      expect(item.price).to eq "GBP 13.99"
    end
  end

  describe "#discount" do
    it "returns the item's discount" do
      expect(item.discount).to eq "Save 30%"
    end
  end

  describe "#box_art" do
    it "returns the box art url" do
      expect(item.box_art).to eq "/images/xbox-one/BZ7FPSGCCMQQ.png"
    end
  end

  describe "#title" do
    it "returns the item title" do
      expect(item.title).to eq "11-11 Memories Retold"
    end
  end

  describe "#amount" do
    it "retrns the item amount" do
      expect(item.amount).to eq 13.99
    end
  end

  describe "#currency" do
    it "returns the item currency" do
      expect(item.currency).to eq "GBP"
    end
  end

  describe "#details" do
    it "returns the details" do
      expect(item.details[:discount]).to eq "Save 30%"
      expect(item.details[:box_art]).to eq "/images/xbox-one/BZ7FPSGCCMQQ.png"
      expect(item.details[:title]).to eq "11-11 Memories Retold"
      expect(item.details[:currency]).to eq "GBP"
      expect(item.details[:amount]).to eq 13.99
    end
  end
end
