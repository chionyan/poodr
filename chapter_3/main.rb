require_relative '../my_helper'
my_require __FILE__

class Main
  def self.run
    Gear.new(
      chainring: 52,
      cog: 11,
      wheel: Wheel.new(26, 1.5)
    ).gear_inches
  end
end

p Main.run
