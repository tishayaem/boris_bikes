require_relative 'bike'
# require "pry"

class DockingStation
  attr_accessor :bikes, :broken_bikes

  def initialize
    @bikes = []
    @broken_bikes = []
    @capacity = set_capacity
  end

  def set_capacity(capacity = 20)
  	capacity
  end

  def release_bike
    raise "There are no bikes here!" if empty?
    working_bikes = bikes.select{|bike| bike.working?}
    # binding.pry
   	raise "There is no working bike available." if working_bikes.empty?
  	bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    raise "No space to dock here." if full?
    @bikes << bike
  end

  def returns_broken_bikes
 		@bikes.select{|bike| !bike.working?}
  end

  private
  def full?
  	@bikes.length >= set_capacity
  end

  def empty?
  	@bikes.length == 0
  end
end
