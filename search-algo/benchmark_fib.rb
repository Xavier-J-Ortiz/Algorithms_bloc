require 'benchmark'
require_relative 'fibonnaci_recursive'
require_relative '../fibonnaci/fibonnaci'

n = 20000


Benchmark.bm do |x|
  x.report(:fibonnaci_iterative) { 
    fib(n)
  }

  x.report(:fibonnaci_recursive) {
    fib_recursive(n)
  } 
end
