require_relative 'bicycle'

class RoadBike < Bicycle
  attr_reader :tape_color

   def initialize(**args)
    @tape_color = args[:tape_color]
    super(args) # <- RoadBike は 'super' を必ず呼ばなければなくなった
   end

   # 全ての自転車は、デフォルト値として同じタイヤサイズとチェーンサイズを持つ
  def spares
    {
      chain: '10-speed',
      tire_size: '23',
      tape_color: tape_color
    }
  end

   # 他にも様々なメソッド
end

road_bike = RoadBike.new(
    size: 'M',
    tape_color: 'red'
)
p road_bike.size
