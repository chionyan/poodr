require './my_helper'
my_require __FILE__

class Main
  # 引数を持つハッシュを渡すことで Gear のインスタンスを作成できるようになる
  def self.run
    GearWrapper.gear(
      chainring: 52,
      cog: 11,
      wheel: Wheel.new(26, 1.5)
    ).gear_inches
  end
end

p Main.run
