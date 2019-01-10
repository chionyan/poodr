##################################################
# Customer: 参加者クラス
#
class Customer
  def initialize(args)
    @date = args[:date]             # 希望する日付
    @difficulty = args[:difficulty] # 体力レベル
    @need_bike = args[:need_bike]   # 自転車レンタル希望可否
  end

  # 参加者が希望する旅行の一覧を取得
  # @return [Array<Trip>] 検索結果に合致した旅行一覧
  #
  def suitable_trips
    Trip.suitable_trips(
      @date, @difficulty, @need_bike
    )
  end
end

##################################################
# Trip: 旅行クラス
#
class Trip
  @trips = [] # 旅行一覧
  attr_reader :date, :difficulty

  def initialize(args)
    @date = args[:date]             # 日付
    @difficulty = args[:difficulty] # 体力レベル
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
  def self.suitable_trips(on_date, of_difficulty, _need_bike)
    ret = []
    @trips.each do |trip|
      ret << trip if trip.date == on_date && trip.difficulty == of_difficulty
    end
    ret
  end
end

##################################################
# Setup: セットアップモジュール
#
module Setup
  DATES = ['2019/1/18', '2019/1/19', '2019/1/20']
  DIFFICULTIES = ['easy', 'normal', 'hard']

  # 旅行インスタンスを作成し、旅行一覧にセットする
  #
  def self.trips
    2.times do
      DATES.each do |date|
        DIFFICULTIES.each do |difficulty|
          trip = Trip.new(date: date, difficulty: difficulty)
          Trip.set(trip)
        end
      end
    end
  end
end

########################################
# 旅行一覧の作成
#
Setup.trips

# 参加者を作成し、希望に合致する旅行一覧を取得する
#
moe = Customer.new({
  date: '2019/1/19',
  difficulty: 'normal',
  need_bike: true
})

p moe.suitable_trips
