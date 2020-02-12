# frozen_string_literal: true


def get_card_info(card_num) # 51
  # card_num = 51 のとき
  text_num = get_card_text(card_num)[0]
  return {
    mark:        get_card_mark(card_num), # ハート
    text_num:    get_card_text(card_num)[0], # 13
    text_symbol: get_card_text(card_num)[1], # K
    point:       get_card_point(text_num)
  }
end


#　get_card_info関係の関数 ----------------------------------------------------
def get_card_mark(card_num)
  mark_num = card_num%4

  case mark_num
  when 0
    "ハート"
  when 1
    "ダイヤ"
  when 2
    "クラブ"
  when 3
    "スペード"
  end
end



def get_card_text(card_num)
  text_num = (card_num% 13) + 1
  case text_num
  when 1
    text_symbol = "A"
  when 11
    text_symbol = "J"
  when 12
    text_symbol = "Q"
  when 13
    text_symbol = "K"
  else
    text_symbol = text_num.to_s
  end
  return [text_num, text_symbol]
end



def get_card_point(num)
  if num >10
    return num = 10
  end

  num
end
# ----------------------------------------------------


def judge_game(player_point,dealer_point)
  case
  when player_point > dealer_point
    puts "プレイヤーの勝利です。おめでとうございます。"
  when dealer_point > player_point
    puts "ディーラーの勝利です。お疲れ様です。"
  when player_point == dealer_point
    puts "引き分けです。ゲームは終了です。"
  else
    return
  end
end