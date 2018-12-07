RSpec.describe Xbox::Storeparser::Page do
  let(:path) { File.dirname(__FILE__) + '/../fixtures/index.html' }
  let(:page) { described_class.new(path) }

  describe "#doc" do
    it "fetches html document" do
      expect(page.doc).to be_instance_of Nokogiri::HTML::Document
    end
  end

  describe "#nav_wrapper" do
    it "gets navigation link wrapper" do
      expect(page.nav_wrapper.name).to eq 'ul'
    end
  end

  describe "#nav_links" do
    it "returns the navigation links for scraping" do
      expect(page.nav_links.class).to eq Nokogiri::XML::NodeSet
    end
  end

  describe "#max_page" do
    it "returns the max page from nav links" do
      expect(page.max_page).to eq 7
    end
  end

  describe "items" do
    it "returns the listed products on sale" do
      expect(page.items.length).to eq 35
    end
  end
end
