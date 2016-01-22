require "van"

describe Van do	

	let(:bike) {double :bike}

  it { is_expected.to respond_to :take_bikes }

  describe "Picking up broken bikes" do

	  it 'picks up broken bikes' do
	  	bike = Bike.new
	  	station = DockingStation.new
	    bike.break
	    station.dock(bike)
			expect(subject.take_bikes(station.returns_broken_bikes)).to include bike
		end 
	end
end