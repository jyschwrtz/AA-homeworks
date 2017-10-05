require 'byebug'

def sum_to(n)
  return 1 if n == 1
  return nil if n < 0
  n + sum_to(n-1)
end

def add_numbers(nums_array)
  return nil if nums_array.empty?
  return nums_array.first if nums_array.length == 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(num)
  return nil if num == 0
  if num == 1
    1
  else
    (num - 1) * gamma_fnc(num - 1)
  end
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return "" if string.empty?
  string[-1] + reverse(string[0...-1])
end
