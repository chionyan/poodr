# 自分以外の同じディレクトリのファイルを require する
# main.rb でのみ使う
#
def my_require(file_name)
  Dir.glob("./#{File.dirname(file_name)}/*.rb") do |file|

    next if file == "./#{file_name}"
    require file
  end
end
