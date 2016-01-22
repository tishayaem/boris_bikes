require "docking_station"

describe DockingStation do

	let(:bike) {double :bike}

  it { is_expected.to respond_to :release_bike }

  it 'releases a working bike' do
  	bike = double("bike", :working? => true)
  	subject.dock(bike)
  	released_bike = subject.release_bike
  	expect(released_bike).to be_working
  end

  it 'release a bike' do
  	bike = double("bike", :working? => true)
  	subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it "doesn't release a bike if there are none available" do
    expect {subject.release_bike}.to raise_error("There are no bikes here!")
  end

  it "doesn't dock a bike if over capacity" do
     subject.set_capacity.times{subject.dock(double(:bike))}
     expect{subject.dock(double(:bike))}.to raise_error("No space to dock here.")
  end

  it {is_expected.to respond_to(:dock)}

  it 'docks a bike' do
    expect(subject.dock(bike).last).to eq bike
  end

  it {is_expected.to respond_to :bikes}

  it 'returns docked bike' do
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end

  it 'sets a new capacity when provided a new value' do
  	expect(subject.set_capacity(30)).to eq 30
  end

  it 'checks if default capacity is 20' do
  	expect(subject.set_capacity).to eq 20
  end

  describe "Broken Bike" do

  	before(:example) do
	  	allow(bike).to receive(:working?).and_return(false)
	  	allow(bike).to receive(:break).and_return(false)
	    bike.break
	  end

	  it 'reports that a bike is broken' do
	    expect(bike).to_not be_working
	  end

	  it 'does not release a broken bike' do
	    subject.dock(bike)
	    expect {subject.release_bike}.to raise_error("There is no working bike available.")
	  end

	  it 'removes broken bike' do
			subject.dock(bike)
			expect(subject.remove_bikes).to include(bike) 
		end
	end

		it { is_expected.to respond_to :remove_bikes}
end
