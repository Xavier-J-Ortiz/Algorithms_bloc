def bucket_sort array 
  buckets = distribute_elements array 
  return organize_bucket_to_sorted_array buckets 
end

def distribute_elements array 
  bucket_length = array.length / 2
  max_value = array.max 
  min_value = array.min
  buckets = []
  coefficient = (min_value < 0 ? min_value.abs : 0)
  (0...array.length).each do |index|
    normalizing_value = ((array[index] + coefficient) / (max_value + coefficient).to_f)
    position = (bucket_length * normalizing_value).to_i
    if buckets[position]
      insert_in_order(array, buckets, position, index)
    else
      buckets[position] = [array[index]]
    end
  end
  return buckets
end

def insert_in_order(array, buckets, position, index)
  current_bucket = buckets[position]
  (0..current_bucket.length).each do |location|
    next_bucket_position_exists = (current_bucket[location + 1])
    less_than_next_bucket_position = (next_bucket_position_exists and current_bucket[location + 1] >= array[index])
    greater_than_current_bucket_position = (current_bucket[location] < array[index])
    insert_in_next_location = (greater_than_current_bucket_position and less_than_next_bucket_position)
    insert_in_first_position = (location == 0 and current_bucket[location] >= array[index])
    insert_in_last_position = (location == (current_bucket.length - 1) and current_bucket[location] < array[index])
    if insert_in_next_location
      current_bucket.insert((location + 1), array[index])
      return
    elsif insert_in_first_position
      current_bucket.insert(location, array[index])
      return
    elsif insert_in_last_position
      current_bucket.push(array[index])
      return
    end
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
