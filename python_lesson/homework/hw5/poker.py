# 經由亂數發撲克牌(52張)，分為四組列印出來。
import random
list_four_suits = ['♠', '♥', '♦', '♣']
list_number = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']


def produce_poker_list():
    list_poker = []
    for i in range(len(list_four_suits)):
        for j in range(len(list_number)):
            list_poker.append(list_four_suits[i]+list_number[j])
    return list_poker


def shuffle(list_poker):
    shuffled_poker = []
    for i in range(len(list_poker)-1, -1, -1):
        pick_poker = random.randint(0, i)
        shuffled_poker.append(list_poker[pick_poker])
        list_poker[i], list_poker[pick_poker] = list_poker[pick_poker], list_poker[i]
    return shuffled_poker


def licensing_poker(shuffled_poker):
    player_list = ['player_1:\t', 'player_2:\t', 'player_3:\t', 'player_4:\t']
    shuffled_poker_player = [[], [], [], []]

    for i in range(len(shuffled_poker)):
        if i % len(player_list) == 0:
            shuffled_poker_player[0].append(shuffled_poker[i])
        elif i % len(player_list) == 1:
            shuffled_poker_player[1].append(shuffled_poker[i])
        elif i % len(player_list) == 2:
            shuffled_poker_player[2].append(shuffled_poker[i])
        else:
            shuffled_poker_player[3].append(shuffled_poker[i])
    for j in range(len(shuffled_poker_player)):
        print('{}{}'.format(player_list[j], shuffled_poker_player[j]))


def main():
    licensing_poker(shuffle(produce_poker_list()))


main()