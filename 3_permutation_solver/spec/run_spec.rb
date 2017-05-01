require'spec_helper'

require_relative '../run'

RSpec.describe Object do
  context '@solve(' do
    it 'works' do
      arr = [6,3,7,4]
      arr_length = arr.length
      substr_length = 3

      expect(solve(arr_length, substr_length, arr)).to eq [ 4, 1 ]
    end

    it 'works' do
      arr = [3,5,6]
      arr_length = arr.length
      substr_length = 2

      expect(solve(arr_length, substr_length, arr)).to eq [4, 1]
    end

    it 'works', focus: true do
      arr = [21,19,22,20]
      arr_length = arr.length
      substr_length = 2

      expect(solve(arr_length, substr_length, arr)).to eq [20, 3]
    end

    it 'works' do
      arr = [9,15,27,14]
      arr_length = arr.length
      substr_length = 3

      expect(solve(arr_length, substr_length, arr)).to eq [10, 1]
    end
  end
end


# sort it
  # if sorted has entry doesn't exist
    # check to see if it is the new highest value

    # if highest val

    # if == highest val

  # if sorted entry exists
    # add new permutation to solution array


[21, 19] # no
[21, 22] # yes
[21, 20] # yes
[19, 21] # no
[19, 22] # no
[19, 20] # no
# [22, 21] # yes
[22, 19] # no
[22, 20] # yes
# [20, 21] # yes
[20, 19] # no
# [20, 22] # yes
