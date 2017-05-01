require'spec_helper'
require_relative '../run'

RSpec.describe Object do
  context '@query' do

    context 'returns the correct number_of_permutations%(10^9 + 7), given (array length, mininum numbers that need to be adjacent to a larger number)' do
      let(:ph){PermutationHappiness.new}

      it '' do
        expect(ph.query(3, 1)).to eq 6
      end

      it '' do
        expect(ph.query(3, 2)).to eq 4
      end

      it '' do
        expect(ph.query(4, 3)).to eq 8
      end

      it '' do
        expect(ph.query(10, 7)).to eq 1433856
      end
    end
  end


  xcontext '@factorial' do
    it 'works' do
      expect(factorial(0)).to eq 1
    end

    it 'works' do
      expect(factorial(1)).to eq 1
    end

    it 'works' do
      expect(factorial(2)).to eq 2
    end
    it 'works' do
      expect(factorial(3)).to eq 6
    end

    it 'works' do
      expect(factorial(4)).to eq 24
    end
  end

  xcontext '@factorial' do
    context 'edge cases' do
      it 'enough_happy_people?' do
        expect(enough_happy_people?(0,[0])).to eq false
      end

      it '' do
        expect(enough_happy_people?(0,[])).to eq false
      end

      it 'enough_happy_people??' do
        expect(enough_happy_people?(1,[])).to eq false
      end

      it '' do
        expect(enough_happy_people?(1,[0])).to eq true
      end
    end

    context 'normal cases' do
      it '' do
        expect(enough_happy_people?(1,[1,2,3])).to eq true
      end

      it '' do
        expect(enough_happy_people?(2, [1,2,3])).to eq true
      end

      it '' do
        expect(enough_happy_people?(3, [1,2,3])).to eq false
      end

      it '' do
        expect(enough_happy_people?(3, [1,2,3])).to eq false
      end
    end
  end

end
