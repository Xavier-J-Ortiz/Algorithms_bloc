require_relative '../quicksort/quicksort'

def sort_bucket(array)
  bucket_length = array.length / 2
  max_value = array.max 
  min_value = array.min
  buckets = distribute_across_buckets(array, bucket_length, max_value, min_value)
  return find_and_organize(buckets)
end

def distribute_across_buckets(array, bucket_length, max_value, min_value)
  buckets = []
  coefficient = (min_value < 0 ? min_value.abs : 0)
  (0...array.length).each do |array_position|
    bucket_position = (bucket_length * ((array[array_position] + coefficient) / (max_value + coefficient).to_f)).to_i
    buckets[bucket_position] = buckets[bucket_position] ? buckets[bucket_position].push(array[array_position]) : [array[array_position]]
  end
  return buckets
end

def find_and_organize(buckets)
  answer = []
  (0...buckets.length).each do |bucket_position|
    if buckets[bucket_position]
      buckets[bucket_position] = quicksort(buckets[bucket_position])
      answer += buckets[bucket_position]
    end
  end
  return answer
end


=begin
puts sort_bucket([1, 2, 3, 4, 5]).to_s
puts sort_bucket([12, 11, 13, 5, 6, 7]).to_s
puts sort_bucket([-5, 5, 23, 24, 9, 4, 3, 20, 2, 1, -11]).to_s
=end

