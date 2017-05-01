#!/bin/ruby

class PermutationHappiness
  attr_reader :solutions_counter

  def initialize
    @solutions_counter = 0
  end

  def query(array_length, happy_people_quota)
    reset_solutions_counter

    return _query_recursion((1..array_length).to_a, [], happy_people_quota) % (10**9 + 7)
  end

  private
    def _query_recursion(arr_remaining, arr_assembled, happy_people_quota)
      if(
          arr_assembled.length >= happy_people_quota &&
          enough_happy_people?(happy_people_quota, arr_assembled)
        )
        @solutions_counter += factorial(arr_remaining.length)
        return @solutions_counter
      end

      arr_remaining.each_with_index do |num, i|
        _query_recursion(arr_remaining[0...i] + arr_remaining[i+1...arr_remaining.length], arr_assembled + [num], happy_people_quota)
      end

      @solutions_counter
    end

    def enough_happy_people?(happy_people_quota, arr_assembled)
      return false if (arr_assembled.length == 0 || happy_people_quota == 0)

      if (arr_assembled.length >= 1 && happy_people_quota <= 1)
        return true
      end

      counter = 0

      for i in 0...arr_assembled.length
        if 0 < i && arr_assembled[i] < arr_assembled[i-1]
          counter += 1
        elsif i < arr_assembled.length - 1  && arr_assembled[i] < arr_assembled[i+1]
          counter += 1
        end
      end

      return (counter == happy_people_quota)
    end

    def factorial(n=0)
      return 1 if n <= 1

      (1..n).inject(:*)
    end

    def reset_solutions_counter
      @solutions_counter = 0
    end
end




# results = []
# q = gets.strip.to_i
# for a0 in (0..q-1)
#     n, k = gets.strip.split(' ')
#     n = n.to_i
#     k = k.to_i
#     # Find the number of ways to arrange 'n' people such that at least 'k' of them will be happy
#     # The return value must be modulo 10^9 + 7
#     results << query(n, k)
# end

# results.each{|result| puts result}
