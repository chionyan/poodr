class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    # refactor 1: 配列を繰り返し処理する
    wheels.collect { |wheel| diameter(wheel) }
  end

  def diameter(wheel)
    # refactor 2: 「1つ」の車輪の直径を計算する
    wheel.rim + (wheel.tire * 2)
  end

  # 変更箇所はここから先だけでよくなる
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end

data = [[622, 20], [622, 23], [559, 30], [559, 40]]
puts RevealingReferences.new(data).diameters
