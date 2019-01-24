# 旅行の準備はよりかんたんになる
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(**args)
    @bicycles = args[:bicycles]
    @customers = args[:customers]
    @vehicle = args[:vehicle]
  end

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_trip(self)
    end
  end
end

# 全ての準備者(Preparer)は 'prepare_trip' に応答するダック
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each do |bicycle|
      prepare_bicycle(bicycle)
    end
  end

  def prepare_bicycle(bicycle)
    p "#{bicycle}を用意する"
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
    p "#{customers.size}人分のご飯を用意する"
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

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
