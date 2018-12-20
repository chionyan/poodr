require_relative '../wheel'

# Gear が外部インターフェースの一部の場合
module GearFrameWork
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end

    def gear_inches
      ratio * diameter
    end

    def ratio
      chainring / cog.to_f
    end

    def diameter
      wheel.diameter
    end
  end
end
