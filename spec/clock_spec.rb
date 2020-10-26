require 'clock'

RSpec.describe Clock do

  let(:rule1) { double :rule  }
  let(:rule2) { double :rule  }
  let(:rule3) { double :rule  }
  let(:rules) { [rule1, rule2, rule3] }
  let(:world) { double :world }
  subject { described_class.new(rules)}

  describe '#tick' do
    it 'applies each rule to the world' do
      expect(rule1).to receive(:apply_to).with(world)
      expect(rule2).to receive(:apply_to).with(world)
      expect(rule3).to receive(:apply_to).with(world)

      subject.tick(world)
    end
  end
end