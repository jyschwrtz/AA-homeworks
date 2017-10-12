require 'set'

#Big O-ctopus and Biggest Fish

def sluggish(arr) #O(n^2)
  arr.each do |word|
    return word if arr.all? { |other_word| word.length >= other_word.length }
  end
end

def dominant(arr) # O(n log n)
  return arr[0] if arr.length <= 1

  mid_idx = arr.length / 2
  left = dominant(arr.take(mid_idx))
  right = dominant(arr.drop(mid_idx))
  merge(left, right)
end

def merge(left, right)
  until left.empty? || right.empty?
    case left.length <=> right.length
    when -1, 0
      return right
    when 1
      return left
    end
  end
end

def clever(arr) #O(n)
  longest = arr.shift
  arr.each do |word|
    longest = word if word.length > longest.length
  end
  longest
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish(fish)
p dominant(fish)
p clever(fish)

#Dancing Octopus


def slow_dance(dir, tiles_array)
  tiles_array.each_index do |idx|
    return idx if dir == tiles_array[idx]
  end
end

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {}
tiles_array.each.with_index do |dir, idx|
  tiles_hash[dir] = idx
end

p slow_dance("up", tiles_array) # > 0
p slow_dance("right-down", tiles_array) # > 3
p fast_dance("up", tiles_hash) # > 0
p fast_dance("right-down", tiles_hash) #  > 3
