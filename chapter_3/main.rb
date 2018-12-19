require_relative '../my_helper'
my_require __FILE__

class Main
  def self.run
    Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
  end
end

p Main.run
