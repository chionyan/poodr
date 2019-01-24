class Trip
  def initialize
    @mechanic = Mechanic.new
    @bicycles = Bicycle.all_bicycles
  end

  def bicycles
    @bicycles.each do |bicycle|
      @mechanic.clean_bicycle(bicycle)
      @mechanic.pump_tires(bicycle)
      @mechanic.lube_chain(bicycle)
      @mechanic.check_brakes(bicycle)
    end
  end
end


class Mechanic
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


Trip.new.bicycles
