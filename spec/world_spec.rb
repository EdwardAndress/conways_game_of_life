require 'world'

RSpec.describe World do
  context 'when the first cell of every row in a 3 x 3 grid is alive' do
    let(:seeds) { [[0,0], [1,0], [2,0]] }
    subject { described_class.new(width: 3, height: 3, seeds: seeds) }
    
    describe '#live_cells' do
      it 'returns the coordinates of all the live cells in the world' do
        expect(subject.live_cells).to eq seeds
      end
    end

    describe '#dead_cells' do
      it 'returns the coordinates of all the dead cells in the world' do
        expect(subject.dead_cells)
          .to eq [[0, 1], [0, 2], [1, 1], [1, 2], [2, 1], [2, 2]]
      end
    end

    describe '#kill_cell' do
      before do
        subject.kill_cell(0,0)
      end

      it 'one fewer cells are alive' do
        expect(subject.live_cells).to eq [[1, 0], [2, 0]]
      end

      it 'one more cell is dead' do
        expect(subject.dead_cells)
          .to eq [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 1], [2, 2]]
      end
    end

    describe '#animate_cell' do
      before do
        subject.animate_cell(0,1)
      end

      it 'one more cell is alive' do
        expect(subject.live_cells).to eq [[0, 0], [0, 1], [1, 0], [2, 0]]
      end

      it 'one fewer cells are dead' do
        expect(subject.dead_cells).to eq [[0, 2], [1, 1], [1, 2], [2, 1], [2, 2]]
      end
    end

    describe '#neighbours_of' do
      context 'for a cell on the left edge' do
        it 'returns all neighbours, wrapping to the right edge' do
          expect(subject.neighbours_of(1,0))
          .to contain_exactly [0,-1], [0,0], [0,1], [1,-1], [1,1], [2,-1], [2,0], [2,1]
        end
      end
      
      context 'for a cell on the right edge' do
        it 'returns all neighbours, wrapping to the left edge' do
          expect(subject.neighbours_of(1,2))
          .to contain_exactly [0,0], [0,1], [0,2], [1,0], [1,1], [2,0], [2,1], [2, 2]
        end
      end

      context 'for a cell in the bottom row' do
        it 'returns all neighbours, wrapping to the top row' do
          expect(subject.neighbours_of(2,1))
            .to contain_exactly [1,0], [1,1], [1,2], [2,0], [2,2], [0,0], [0,1], [0,2]
        end
      end

      context 'for a cell on the top row' do
        it 'returns all neighbours, wrapping to the bottom row' do
          expect(subject.neighbours_of(0,1))
            .to contain_exactly [-1,0], [-1, 1], [-1, 2], [0,0], [0,2], [1,0], [1,1], [1,2]
        end
      end
    end

    describe '#live_neighbour_count' do
      it 'returns the number of live neighbours for a given cell' do
        expect(subject.live_neighbour_count(1,0)).to eq 2
      end
    end
  end
end