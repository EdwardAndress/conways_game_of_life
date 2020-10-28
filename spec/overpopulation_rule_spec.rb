require 'overpopulation_rule'

RSpec.describe OverpopulationRule do

  let(:world) { double :world, live_cells: [[0,1], [1,0], [1,1], [1,2], [2,1]] }
  let(:new_world) { double :world }

  describe '#apply_to' do
    describe 'applies the rule to a world' do
      it 'killing live cells that have more than 3 neighbours' do
        allow(world).to receive(:live_neighbour_count).and_return(3,2,4,2,3)
        expect(new_world).to receive(:kill_cell).with(1,1)
        OverpopulationRule.apply_to(world, new_world)
      end
    end
  end
end