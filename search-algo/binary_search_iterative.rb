def binary_search_iterative(array, value)
  low = 0
  high = array.length - 1

  while low <= high
    mid = (low + high) / 2
    if array[mid] > value
      high = mid - 1
    elsif array[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return "nil"
end
=begin
puts binary_search_iterative([2, 4, 6, 8, 10 , 221, 483], 10)
puts binary_search_iterative([2, 4, 6, 8, 10 , 221, 483], 1)
=end
