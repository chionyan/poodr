require_relative 'bicycle'

# いまは Bicycle のサブクラス。
# かつてのBicycle クラスからのコードをすべて含む。
class RoadBike < Bicycle
  attr_reader :size, :tape_color

   def initialize(**args)
    @size = args[:size]
    @tape_color = args[:tape_color]
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
