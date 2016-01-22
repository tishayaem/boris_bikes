require_relative 'bike'
require "pry"

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = set_capacity
  end

  DEFAULT_CAPACITY = 20

  def set_capacity(capacity = DEFAULT_CAPACITY)
  	capacity
  end

  def release_bike
    raise "There are no bikes here!" if empty?
    working_bikes = bikes.select{|bike| bike.working?}
    # binding.pry
   	raise "There is no working bike available." if working_bikes.empty?
  	return bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    raise "No space to dock here." if full?
    @bikes << bike
  end

  private
  def full?
  	@bikes.length >= set_capacity
  end

  def empty?
  	@bikes.length == 0
  end
end
