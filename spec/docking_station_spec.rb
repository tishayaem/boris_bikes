require "docking_station"
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

describe '#release_bike' do

let(:bike) {double :bike}

 it 'releases a bike' do

allow(bike).to receive(:working?).and_return(true)
subject.dock(bike)
released_bike = subject.release_bike
expect(released_bike).to be_working
    end
  end


  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'will not release a broken bike' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument}


  it 'checks if the bike has been docked' do
    bikes = double :bike
    bikes = []
    expect(subject.dock(bikes)).to eq [bikes]
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times {subject.dock double :bike}
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end
  end

  it 'checks capacity can be changed' do
    expect(DockingStation.new(30).capacity).to eq 30
  end

  it 'Checks if no argument passed uses default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
