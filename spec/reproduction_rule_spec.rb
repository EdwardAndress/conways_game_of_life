require 'reproduction_rule'

RSpec.describe ReproductionRule do

  let(:dead)  { [[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]] }
  let(:world) { double :world, dead_cells: dead       }

  describe '#apply_to' do
    describe 'applies the rule to a world' do
      it 'brings dead cells to life, when they have exactly 3 live neighbours' do
        allow(world).to receive(:live_neighbour_count).and_return(2,3,2,0,0,0)
        expect(world).to receive(:animate_cell).with(1,1)
        ReproductionRule.apply_to(world)
      end
    end
  end
end