def find_alphabet_occurrence_array(string):
    alphabet_array = [0] * 26

    for char in string:
        if not char.isalpha():
            continue
        arr_index = ord(char) - ord('a') # ord : 아스키코드 숫자로 변환
        alphabet_array[arr_index] += 1
    return alphabet_array


def find_max_occurred_alphabet(string):
    alphabet_array = find_alphabet_occurrence_array(string)
    max_occurrence = alphabet_array[0]
    max_index = 0
    for i in range(len(alphabet_array)):

        if (alphabet_array[i] > max_occurrence):
            max_occurrence = alphabet_array[i]
            max_index = i

    return chr(max_index + 97)

result = find_max_occurred_alphabet
print("정답 = i 현재 풀이 값 =", result("hello my name is dingcodingco"))
print("정답 = e 현재 풀이 값 =", result("we love algorithm"))
print("정답 = b 현재 풀이 값 =", result("best of best youtube"))