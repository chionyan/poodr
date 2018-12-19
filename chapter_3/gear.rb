require_relative 'wheel'

class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end
