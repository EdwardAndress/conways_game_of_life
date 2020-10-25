require 'world'

RSpec.describe World do
  context 'when the first cell of every row in a 3 x 3 grid is alive' do
    let(:seeds) { [[0,0], [1,0], [2,0]] }
    subject { described_class.new(3, 3, seeds) }
    
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
  end
end