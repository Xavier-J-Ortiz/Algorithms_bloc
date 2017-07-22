def binary_search_recursive(array, first_position, last_position, value)
  low = first_position
  high = last_position

  mid = (low + high) / 2
  if low > high
    return "nil"
  elsif array[mid] == value 
    return mid
  elsif array[mid] > value
    high = mid - 1
    binary_search_recursive(array, low, high, value)
  elsif array[mid] < value
    low = mid + 1
    binary_search_recursive(array, low, high, value)
  end
end

=begin
array = [2, 4, 6, 8, 10 , 221, 483]
last_position = array.length - 1
puts binary_search_recursive(array, 0, last_position, 4)
puts binary_search_recursive(array, 0, last_position, 220000)
=end
