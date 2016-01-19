require "docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe 'release_bike' do
    it { expect(subject.release_bike).to be_an_instance_of Bike}
    it { expect(Bike.new.working?).to eq true}
  end
end
