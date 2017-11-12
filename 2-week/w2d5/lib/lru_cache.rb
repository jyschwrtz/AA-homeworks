class LRUCache
  attr_reader :cache
  def initialize(size)
    @size = size
    @cache = Array.new(size)
  end

  def count
    @cache.count { |el| !el.nil? }
    # returns number of elements currently in cache
  end

  def add(el)
    remove_from_cache(el)
    @cache.push(el)
    delete_least_used
    # adds element to cache according to LRU principle
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

  private
  # helper methods go here!
  def remove_from_cache(el)
    @cache.delete(el) if @cache.include?(el)
  end

  def delete_least_used
    if @cache.length > @size
      @cache.shift until @cache.length == @size
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end
