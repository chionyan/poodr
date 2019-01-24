class Trip
  # Trip のパブリックインタフェースは bicycles を含む
  attr_reader :bicycles

  def initialize
    @bicycles = Bicycle.all_bicycles
  end
end


class Mechanic
  # Mechanic のパブリックインタフェースは prepare_trip を含む
  def prepare_trip(trip)
    bicycles = trip.bicycles
    bicycles.each do |bike|
      prepare_bicycle(bike)
    end
  end

  private

  def prepare_bicycle(bike)
    clean_bicycle(bike)
    pump_tires(bike)
    lube_chain(bike)
    check_brakes(bike)
  end

  def clean_bicycle(bike)
    puts "#{bike.name} を洗浄する"
  end

  def pump_tires(bike)
    puts "#{bike.name} に空気を入れる"
  end

  def lube_chain(bike)
    puts "#{bike.name} のチェーンに油を差す"
  end

  def check_brakes(bike)
    puts "#{bike.name} のブレーキをチェックする"
  end
end


class Bicycle
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all_bicycles
    bicycles = []
    3.times do |i|
      bicycles << self.new("Bicycle #{i + 1}")
    end
    bicycles
  end
end


Mechanic.new.prepare_trip(Trip.new)
