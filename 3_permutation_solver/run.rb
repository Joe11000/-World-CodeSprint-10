#!/bin/ruby

def solve(arr_length, permutation_substring_length, arr)
  PermutationSolver.new({arr: arr, arr_length: arr_length, permutation_substring_length: permutation_substring_length}).solve
end

class PermutationSolver
  attr_reader :arr, :arr_length, :permutation_substring_length, :solutions

  def initialize args=({})
    @arr = args[:arr]
    @arr_length = args[:arr_length]
    @permutation_substring_length = args[:permutation_substring_length]
    @highest_solution_counter = nil
    @highest_solution_value = nil
    @solutions = {}
  end

  def solve()
    arr.permutation(permutation_substring_length).to_a.reverse_each do |perm|
      sorted_perm = perm.sort
      @new_bitwiseand_value = @solutions[sorted_perm.join('')]

      # if a uniq solution
      if @new_bitwiseand_value == nil
        # save sorted solution if it doesn't exist yet
        @new_bitwiseand_value = _bitwise_permutation_value_for(sorted_perm)
        @solutions[sorted_perm.join('')] = @new_bitwiseand_value

        # save if highest_solution_counter
        if @highest_solution_value == nil ||
           @new_bitwiseand_value > @highest_solution_value
            @highest_solution_counter = 1
            @highest_solution_value = @new_bitwiseand_value

        elsif @new_bitwiseand_value == @highest_solution_value
          @highest_solution_counter += 1
        end
      end
      @highest_solution_counter = ( @highest_solution_counter || 0) % (10**9 + 7)
    end

    return [ ( @highest_solution_value || 0 ) % (10**9 + 7), @highest_solution_counter || 0 ]
  end

  private
    def _bitwise_permutation_value_for permutaion_arr
      return 0 if permutaion_arr.include? 0

      bitwise_result = permutaion_arr[0]
      for i in 1...permutaion_arr.length do
        bitwise_result = bitwise_result & permutaion_arr[i]

        if bitwise_result == 0 ||
          ( @highest_solution_counter != nil && bitwise_result < @highest_solution_counter ) # bail if result won't be the highest one found

          return bitwise_result
        end
      end

      bitwise_result
    end
end


# n, k = gets.strip.split(' ')
# n = n.to_i
# k = k.to_i
# a = Array.new(n)
# for a_i in (0..n-1)
#     a[a_i] = gets.strip.to_i
# end
# result = solve(n, k, a)
# print result.join("\n")
