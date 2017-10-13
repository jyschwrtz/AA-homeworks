require 'rspec'
require 'lru_cache'

RSpec.describe LRUCache do
  subject(:lru) { LRUCache.new(4) }

  describe "#initialize" do
    it "creates an array(cache) of given input size" do
      expect(lru.cache).to eq([nil, nil, nil, nil])
    end
  end

  describe "#count" do
    context "when nothing has been added" do
      it "returns the size of the cache not including nil's" do
        expect(lru.count).to eq(0)
      end
    end
    context "when cache is full" do
      it "returns the size of the cache" do
        4.times { |i| lru.add(i) }
        expect(lru.count).to eq(4)
      end
    end
  end

  describe "#add" do
    it "adds new elements to the cache" do
      lru.add(3)
      expect(lru.cache).to include(3)
    end

    it "removes the last element added when it exceeds the size" do
      5.times { |i| lru.add(i) }
      expect(lru.cache).to eq([1, 2, 3, 4])
    end

    context "if element is already in the cache" do
      it "moves the element up the last-in position" do
        4.times { |i| lru.add(i) }
        lru.add(2)
        expect(lru.cache).to eq([0, 1, 3, 2])
      end
    end
  end

  describe "#show" do
    it "shows the items in the cache, with the LRU item first" do
      4.times { |i| lru.add(i) }
      expect(lru.show).to eq([0, 1, 2, 3])
    end
  end


end
