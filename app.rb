require 'json'
require 'bundler'
Bundler.require


get '/' do
  slim :index
end

post '/divine' do
  content_type :json
  res = {foo: params[:name1], bar: params[:name2]}
  binding.pry
  res.to_json
=begin
  result_num_line = [names_to_num(params[:name1]), names_to_num(params[:name2])].flatten
  result_num = []
  loop do
    result_num << result_num_line.join
    break if result_num_line.join.to_i <= 100
    result_num_line = calc(result_num_line)
  end
  {result: result_num}.to_json
=end
end

private
A_LINE = %w(あ か さ た な は ま や ら わ が ざ だ ば ぱ ぁ ゃ)
I_LINE = %w(い き し ち に ひ み り ゐ ぎ じ ぢ び ぴ ぃ)
U_LINE = %w(う く す つ ぬ ふ む ゆ る ぐ ず づ ぶ ぷ ぅ っ ゅ)
E_LINE = %w(え け せ て ね へ め れ ゑ げ ぜ で べ ぺ ぇ)
O_LINE = %w(お こ そ と の ほ も よ ろ を ご ぞ ど ぼ ぽ ぉ ょ)

# 名前を数字に変換する
def names_to_num(name)
  name_num_ary = []
  name.split('').each do |char|
    name_num_ary << hiragana_to_num(char)
  end
  name_num_ary
end

# ひらがなを数字に変換する
def hiragana_to_num(char)
  if A_LINE.include?(char)
    1
  elsif I_LINE.include?(char)
    2
  elsif U_LINE.include?(char)
    3
  elsif E_LINE.include?(char)
    4
  elsif O_LINE.include?(char)
    5
  elsif char == 'ん'
    0
  else
    # todo Add error handling
    puts '変換できない文字があるよ'
  end
end

# 先頭2文字を足した1の位を新しい配列に入れる
def calc(num_ary)
  new_ary = []
  num_ary.each_cons(2) do |x, y|
    new_ary << (x + y) % 10
  end
  new_ary
end

# 
