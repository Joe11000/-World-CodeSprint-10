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
