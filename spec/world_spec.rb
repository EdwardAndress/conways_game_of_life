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
  end
end