def quicksort(array)
  pivot = array.slice!(-1)
  right_array = []
  left_array = array

  left_length = array.length
  (0...left_length).each do |step|
    location = (left_length - 1) - step
    if (left_array[location] >= pivot)
      right_array.push(left_array.slice!(location))
    end
  end

  if left_array.length + right_array.length <= 1
    return pivot.nil? ? left_array + right_array : left_array + [pivot] + right_array
  else
    return quicksort(left_array) + [pivot] + quicksort(right_array)
  end
end

puts quicksort([5, 4, 3, 2, 1]).to_s
puts quicksort([-5, 5, 23, 42, 9, 4, 3, 200, 2, 1, -11]).to_s
