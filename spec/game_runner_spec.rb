require 'game_runner'

describe GameRunner do

  let(:cells) { [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']] }
  let(:new_world) { double :world, cells: cells }
  let(:world) { double :world, cells: cells }
  let(:clock) { double :clock, tick: new_world }
  subject { described_class.new(world: world, clock: clock)}

  describe '#display_world' do
    it "prints the world in it's current state"  do
      expect{subject.display_world}.to output("   \n   \n   \n").to_stdout
    end
  end

  describe '#clear_screen' do
    it 'clears the terminal screen' do
      expect(subject).to receive(:system).with 'clear'
      subject.clear_screen
    end
  end

  describe '#run' do
    describe 'takes a number of generations (n)' do
      it 'then ticks the clock, displays the world and clears the screen n times' do
        expect(world).to receive(:cells).exactly(1).times
        expect(new_world).to receive(:cells).exactly(1).times
        expect(clock).to receive(:tick).exactly(2).times
        expect(subject).to receive(:system).with('clear').exactly(2).times

        subject.run(2)
      end
    end
  end
end