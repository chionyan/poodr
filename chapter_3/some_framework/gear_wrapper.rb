# 外部のインターフェースをラップし、自身を変更から守る
module GearWrapper
  def self.gear(args)
    GearFrameWork::Gear.new(
      args[:chainring],
      args[:cog],
      args[:wheel]
    )
  end
end
