def titleize(str)
    arr = str.split(" ")
    small_words = ["and", "over", "the", "on", "at", "or", "in", "of", "a", "an"]
    #ternary opertator doing a internal selection
    my_arr = arr.map { |word| small_words.include?(word.downcase) ? word : word.capitalize }
    my_arr[0] = my_arr[0].capitalize
    my_arr.join(" ")
end

class Book
# write your code here
    attr_writer :title

    def title
        @title = titleize(@title)
    end
end
