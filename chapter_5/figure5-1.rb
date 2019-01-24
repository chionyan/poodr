class Trip
  attr_reader :bicycles, :customers, :vehicle

  def initialize(**args)
    @bicycles = args[:bicycles]
    @customers = args[:customers]
    @vehicle = args[:vehicle]
  end

  # この 'mechanic' 引数はどんなクラスのものでもよい。
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

# *この* クラスのインスタンスを渡すことになったとしても、動作する。
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
    p bicycle
  end
end


some_object = Trip.new(
  bicycles: ['bicycle 1', 'bicycle 2'],
  customers: ['customer 1', 'customer 2'],
  vehicle: 'vihicle',
)
mechanic = Mechanic.new
some_object.prepare(mechanic)
