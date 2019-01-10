##################################################
# Customer: 参加者クラス
#
class Customer
  def initialize(args)
    @date = args[:date]             # 希望する日付
    @difficulty = args[:difficulty] # 体力レベル

    # NOTE : シーケンス図に載っていないので初期化の値を入れていない（書き忘れだと思う）
    @need_bike = args[:need_bike]   # 自転車レンタル希望可否
  end

  # 参加者が希望する旅行の一覧を取得
  # @return [Array<Trip>] 検索結果に合致した旅行一覧
  #
  def suitable_trips
    ret = []
    trips = Trip.suitable_trips(@date, @difficulty)
    trips.each do |trip|
      ret << trip if Bicycle.suitable_bicycle(trip.date, trip.route_type)
    end
    ret
  end
end

##################################################
# Trip: 旅行クラス
#
class Trip
  @trips = [] # 旅行一覧
  attr_reader :date, :difficulty, :route_type

  def initialize(args)
    @date = args[:date]             # 日付
    @difficulty = args[:difficulty] # 体力レベル
    @route_type = args[:route_type] # 行程
  end

  # 旅行インスタンスを旅行一覧にセットする
  # @params [Trip] trip 旅行インスタンス
  #
  def self.set(trip)
    @trips << trip
  end

  # 条件に合致した旅行一覧を取得
  # @params [String] on_date 日付
  # @params [String] of_difficulty 体力レベル
  # @return [Array<Trip>] 旅行一覧
  #
  def self.suitable_trips(on_date, of_difficulty)
    ret = []
    @trips.each do |trip|
      ret << trip if trip.date == on_date && trip.difficulty == of_difficulty
    end
    ret
  end
end

##################################################
# Bicycle: 自転車クラス
#
class Bicycle
  @bicycles = [] # 自転車一覧
  attr_reader :type, :rentable_date

  def initialize(args)
    @type = args[:type]                   # 自転車のタイプ
    @rentable_date = args[:rentable_date] # レンタル可能な日付
  end

  # 自転車インスタンスを自転車一覧にセットする
  # @params [Bicycle] bicycle 自転車インスタンス
  #
  def self.set(bicycle)
    @bicycles << bicycle
  end

  # 条件に合致した自転車を取得
  # @params [String] trip_date 旅行の日付
  # @params [String] route_type 行程
  # @return [Bicycle] 自転車
  #
  def self.suitable_bicycle(trip_date, route_type)
    ret = nil
    @bicycles.each do |bicycle|
      if bicycle.rentable_date == trip_date && bicycle.route_type == route_type
        ret = bicycle
        break
      end
    end
    ret
  end

  # クラスメソッドから private メソッドを呼び出せないので public にしている
  # @see https://blog.jnito.com/entry/20120504/1336080083

  # 自転車のタイプから適切な行程を返す
  # @return [String] 行程
  #
  def route_type
    return unless ['road', 'moutain'].include?(@type)

    @type == 'road' ? 'cycling' : 'touring'
  end
end

##################################################
# Setup: セットアップモジュール
#
module Setup
  # 旅行インスタンスを作成し、旅行一覧にセットする
  #
  def self.trips
    ['2019/1/18', '2019/1/19', '2019/1/20'].each do |date|
      ['easy', 'normal', 'hard'].each do |difficulty|
        ['cycling', 'touring'].each do |route_type|
          trip = Trip.new(date: date, difficulty: difficulty, route_type: route_type)
          Trip.set(trip)
        end
      end
    end
  end

  # 自転車インスタンスを作成し、自転車一覧にセットする
  #
  def self.bicycles
    Bicycle.set(Bicycle.new(type: 'road', rentable_date: '2019/1/19'))
    Bicycle.set(Bicycle.new(type: 'road', rentable_date: '2019/1/19'))
    Bicycle.set(Bicycle.new(type: 'moutain', rentable_date: '2019/1/20'))
  end
end

########################################
# 旅行一覧、自転車一覧の作成
#
Setup.trips
Setup.bicycles

# 参加者を作成し、希望に合致する旅行一覧を取得する
#
moe1 = Customer.new({date: '2019/1/18', difficulty: 'normal'})
moe2 = Customer.new({date: '2019/1/19', difficulty: 'hard'})
moe3 = Customer.new({date: '2019/1/20', difficulty: 'normal'})

[moe1, moe2, moe3].each_with_index do |moe, i|
  puts "== moe#{i + 1} さんの可能な旅行一覧 =="
  moe.suitable_trips.each do |trip|
    puts "日付：#{trip.date}　難易度：#{trip.difficulty}　行程：#{trip.route_type}"
  end
end
