def iterative_fib(num)
    result = []
    (0..num).each do |x|
        if x < 2
            result << x
        else
            result << result[-2] + result[-1]
        end
    end
    return result
end

def recursive_fib(num)
  if num < 2
    return num
  else
    return recursive_fib(num - 2) + recursive_fib(num - 1)
  end
end

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
end
