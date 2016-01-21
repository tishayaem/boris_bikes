require "docking_station"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'returns a working Bike' do
    test_bike = Bike.new
    subject.dock(test_bike)
    expect(subject.release_bike).to be_working
  end

  it "doesn't release a bike if there are none available" do
    expect {subject.release_bike}.to raise_error("There are no bikes here!")
  end

  it "doesn't dock a bike if over capacity" do
     DockingStation::DEFAULT_CAPACITY.times{subject.dock(Bike.new)}
     expect{subject.dock(Bike.new)}.to raise_error("No space to dock here.")
  end

  it {is_expected.to respond_to(:dock)}

  it 'docks a bike' do
    test_bike = Bike.new
    expect(subject.dock(test_bike).last).to eq test_bike
  end

  it {is_expected.to respond_to :bikes}

  it 'returns docked bike' do
    test_bike = Bike.new
    subject.dock(test_bike)
    expect(subject.bikes.last).to eq test_bike
  end
end
