def bucket_sort unsorted_array 
  buckets = distribute_elements unsorted_array 
  return organize_bucket_to_sorted_array buckets 
end

def distribute_elements unsorted_array 
  bucket_length = 5
  min_value = unsorted_array.min
  buckets = []
  (0...unsorted_array.length).each do |index|
    position = ((unsorted_array[index] - min_value) / bucket_length)
    if buckets[position]
      insert_in_order(unsorted_array, buckets, position, index)
    else
      buckets[position] = [unsorted_array[index]]
    end
  end
  return buckets
end

def insert_in_order(unsorted_array, buckets, position, index)
  current_bucket = buckets[position]
  location = 0
  while location != current_bucket.length

    next_bucket_position_exists = (current_bucket[location + 1])
    less_than_next_bucket_position = (next_bucket_position_exists and current_bucket[location + 1] >= unsorted_array[index])
    greater_than_current_bucket_position = (current_bucket[location] < unsorted_array[index])
    insert_in_next_location = (greater_than_current_bucket_position and less_than_next_bucket_position)
    insert_in_first_position = (location == 0 and current_bucket[location] >= unsorted_array[index])
    insert_in_last_position = (location == (current_bucket.length - 1) and current_bucket[location] < unsorted_array[index])
   
    if insert_in_next_location
      current_bucket.insert((location + 1), unsorted_array[index])
      location = current_bucket.length - 1
    elsif insert_in_first_position
      current_bucket.insert(location, unsorted_array[index])
      location = current_bucket.length - 1
    elsif insert_in_last_position
      current_bucket.push(unsorted_array[index])
      location = current_bucket.length - 1
    end
    location += 1
  end
end

def organize_bucket_to_sorted_array buckets
  sorted_array = []
  (0...buckets.length).each do |position|
    if buckets[position]
      sorted_array += buckets[position]
    end
  end
  return sorted_array 
end
