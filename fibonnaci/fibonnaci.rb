def fib n
  fib_current = 0
  fib_next = 1
  (0...n).each do | place |
    fib_previous = fib_current
    fib_current = fib_next
    fib_next = fib_previous + fib_next
  end
  return fib_next
end
