require 'underpopulation_rule'

describe UnderpopulationRule do

  let(:world) { double :world, live_cells: [[0,0], [0,1]] }

  describe '#apply_to' do
    describe 'applies the rule to a world' do
      it 'killing live cells that have fewer than 2 neighbours' do
        allow(world).to receive(:live_neighbour_count).and_return(1,1)
        expect(world).to receive(:kill_cell).with(0,0)
        expect(world).to receive(:kill_cell).with(0,1)
        UnderpopulationRule.apply_to(world)
      end
    end
  end
end