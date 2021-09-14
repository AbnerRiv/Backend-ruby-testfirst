#write your code here
def echo(str)
    str
end

def shout(str)
    str.upcase
end

def repeat(str, num=2)
    res = ""
    num.times { res += str + " " }
    res.strip
end

def start_of_word(str, num_char)
    str[0..num_char-1]
end

def first_word(str)
    str.split(" ")[0]
end

def titleize(str)
    arr = str.split(" ")
    small_words = ["and", "over", "the", "on", "at", "or"]
    #ternary opertator doing a internal selection
    my_arr = arr.map { |word| small_words.include?(word.downcase) ? word : word.capitalize }
    my_arr[0] = my_arr[0].capitalize
    my_arr.join(" ")
end