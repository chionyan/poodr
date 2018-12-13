class ObscuringReferences
  attr_reader :data

  # リムとタイヤのサイズの2次元配列を取る
  # ex. data = [[622, 20], [622, 23], [559, 30], [559, 40]]
  def initialize(data)
    @data = data
  end

  def diameters
    # 0はリム、1はタイヤ
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end

  # インデックスで配列の値を参照するメソッド色々
end
