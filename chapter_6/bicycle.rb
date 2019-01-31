class Bicycle
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
