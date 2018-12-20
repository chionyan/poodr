require './my_helper'
my_require __FILE__

class Main
  def self.run
    Wheel.new(26, 1.5, 52, 11).gear_inches
  end
end

p Main.run
