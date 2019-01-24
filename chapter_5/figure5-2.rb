# 旅行の準備はさらに複雑になった
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(**args)
    @bicycles = args[:bicycles]
    @customers = args[:customers]
    @vehicle = args[:vehicle]
  end

  def prepare(preparers)
    preparers.each do |preparer|
      if preparer.kind_of?(Mechanic)
        preparer.prepare_bicycles(bicycles)
      elsif preparer.kind_of?(TripCoordinator)
        preparer.buy_food(customers)
      elsif preparer.kind_of?(Driver)
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    end
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    p "#{bicycle}を用意する"
  end
end

class TripCoordinator
  def buy_food(customers)
    p "#{customers.size}人分のご飯を用意する"
  end
end

class Driver
  def gas_up(vehicle)
    p "#{vehicle}のガソリンを満タンにする"
  end

  def fill_water_tank(vehicle)
    p "#{vehicle}の水タンクを満タンにする"
  end
end


some_object = Trip.new(
  bicycles: ['bicycle 1', 'bicycle 2'],
  customers: ['customer 1', 'customer 2'],
  vehicle: 'vihicle',
)

a = [Mechanic.new, TripCoordinator.new, Driver.new]
some_object.prepare(a)
