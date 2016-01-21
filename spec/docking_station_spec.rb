require "docking_station"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'returns a Bike' do
    test_bike = Bike.new
    subject.dock(test_bike)
    expect(subject.release_bike).to eq test_bike
  end

  it "doesn't release a bike if there are none available" do
    expect {subject.release_bike}.to raise_error("There are no bikes here!")
  end

  it "doesn't dock a bike if over capacity" do
     subject.set_capacity.times{subject.dock(Bike.new)}
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

  it 'sets a new capacity when provided a new value' do
  	expect(subject.set_capacity(30)).to eq 30
  end

  it 'checks if default capacity is 20' do
  	expect(subject.set_capacity).to eq 20
  end

  it 'reports that a bike is broken' do
    bike = Bike.new
    expect(bike.is_broken).to eq true
  end

  it 'does not release a broken bike' do
    bike = Bike.new
    bike.is_broken
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error("There is no bike available")
  end

end
