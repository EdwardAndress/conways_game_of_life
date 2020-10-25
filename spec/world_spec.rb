require 'world'

RSpec.describe World do
  context 'when the first cell of every row in a 3 x 3 grid is alive' do
    subject { described_class.new(3, 3, [0,3,6]) }
    
    describe '#live_cells' do
      it 'returns the indices of all the live cells in the world' do
        expect(subject.live_cells).to eq [0,3,6]
      end
    end

    describe '#dead_cells' do
      it 'returns the indices of all the dead cells in the world' do
        expect(subject.dead_cells).to eq [1,2,4,5,7,8]
      end
    end

    describe '#kill_cell' do

      before do
        subject.kill_cell(0)
      end

      it 'one fewer cells are alive' do
        expect(subject.live_cells).to eq [3,6]
      end

      it 'one more cell is dead' do
        expect(subject.dead_cells).to eq [0,1,2,4,5,7,8]
      end
    end

    describe '#animate_cell' do

      before do
        subject.animate_cell(1)
      end

      it 'one more cell is alive' do
        expect(subject.live_cells).to eq [0,1,3,6]
      end

      it 'one fewer cells are dead' do
        expect(subject.dead_cells).to eq [2,4,5,7,8]
      end
    end
  end
end