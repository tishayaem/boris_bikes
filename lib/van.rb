require_relative 'docking_station.rb'

class Van

attr_reader :cargo

  def initialize(capacity = 20)
    @capacity = capacity
   	@cargo = []
  end

  def take_bikes(broken_bikes)
  	@cargo << broken_bikes
  	@cargo.flatten
  end
end