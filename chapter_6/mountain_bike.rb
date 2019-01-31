require_relative 'bicycle'

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(**args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

moutain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox'
)

p moutain_bike.size
