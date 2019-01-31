class Bicycle
  attr_reader :size # <- RoadBike から昇格した

  def initialize(**args)
   @size = args[:size]  # <- RoadBike から昇格した
  end
end
