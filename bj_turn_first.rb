# frozen_string_literal: true
require './function02'
require "pry"

deck_array = (0..51).to_a.map{|card|
  get_card_info(card)
}


beginning_hands = deck_array.shuffle.take(4).each_slice(2).to_a
deck_array = deck_array.difference(beginning_hands.flatten)

player_hand = beginning_hands[0]
dealer_hand = beginning_hands[1]




puts "プレイヤーは #{player_hand[0][:mark]} の #{player_hand[0][:text_symbol]} をもらいました。"
puts "プレイヤーは #{player_hand[1][:mark]} の #{player_hand[1][:text_symbol]} をもらいました。"
puts "ディーラーは #{dealer_hand[0][:mark]} の #{dealer_hand[0][:text_symbol]} を持っています。"

puts "ヒット? or スタンド?　（input 'h' or 's'）"
hit_or_stand = gets.slice(-2)

# プレイヤーフェーズ
while hit_or_stand == "h"
  player_hand = player_hand.push(deck_array.shuffle.first)
  puts "プレイヤーは #{player_hand.last[:mark]} の #{player_hand.last[:text_symbol]} をもらいました。"


  player_points = player_hand.map{|card|
    card[:point]
  }

  if player_points.sum > 21
    puts "21を超えました。バーストです。"
    puts "プレイヤーの負けです。"
    return
  end

  deck_array = deck_array.difference(beginning_hands.flatten)
  puts "ヒット? or スタンド?　（input 'h' or 's'）"
  hit_or_stand = gets.slice(-2)
end

player_points = player_hand.map{|card|
    card[:point]
  }

# ディーラーフェーズ
puts "ディーラーは #{dealer_hand[1][:mark]} の #{dealer_hand[1][:text_symbol]} と #{dealer_hand[0][:mark]} の #{dealer_hand[0][:text_symbol]}　を持っています。"
dealer_points = dealer_hand.map{|card|
  card[:point]
}


while dealer_points.sum < 17
  dealer_hand = dealer_hand.push(deck_array.shuffle.first)
  puts "ディーラーは #{dealer_hand.last[:mark]} の #{dealer_hand.last[:text_symbol]} をもらいました。"
  dealer_points = dealer_hand.map{|card|
    card[:point]
  }
  if dealer_points.sum > 21
    puts "21を超えました。バーストです。"
    puts "プレイヤーの勝利です。"
    return
  end
  deck_array = deck_array.difference(beginning_hands.flatten)
end



puts "プレイヤーの手札は#{player_points}の#{player_points.sum}点です。"
puts "ディーラーの手札は#{dealer_points}の#{dealer_points.sum}点です。"

judge_game(player_points.sum,dealer_points.sum)

# # 無駄に繰り返す ----------------------------------- 要修正
# player_card = choose_num(deck_array)
# deck_array.delete_at(deck_array[player_card])


# dealer_card = choose_num(deck_array)
# deck_array.delete_at(deck_array[dealer_card])


# hands = deck_array.shuffle.take(4).split(2)
# deck_array = deck_array.difference(hands.flatten)
# hands.map{|card|get_card_info(card)}

# player_cards = deck_array.shuffle.take(2)
# # deck_array = deck_array.difference(player_cards) #別の変数名に変えるべき

# dealer_cards = deck_array.shuffle.take(2)
# # deck_array = deck_array.difference(dealer_cards) #別の変数名に変えるべき

# # ----------------------------------------------------

# hands.each do |hand|
#   get_card_info(hand)
# end

