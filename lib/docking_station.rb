require_relative 'bike'

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
        # "This bike is broken, please try another one"
      for i in 0...@bikes.length
        if not @bikes[i].broken
          return @bikes.delete_at(i)
        end
      end
      raise "There is no bike available"
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
