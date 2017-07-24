require 'benchmark'
require_relative 'bucketsort/bucketsort.rb'
require_relative 'heapsort/heapsort.rb'
require_relative 'quicksort/quicksort.rb'

n = 5000

random_array = []
random_gen = Random.new
(0..n).each do
  random_array.push(random_gen.rand(n * 2))
end
random_array_1 = random_array.clone
random_array_2 = random_array.clone
random_array_3 = random_array.clone
Benchmark.bm do |x|
  x.report(:sort_bucket) {
    sort_bucket(random_array_1)
  } 

  x.report(:quicksort) {
    quicksort(random_array_3)
  } 

  x.report(:heap_sort) { 
    sort_heap(random_array_2)
  }
end
