# check if it's only one vowel
def first_vowel(letter)
    #return the index of the first vowel ocurrance
    letter =~ /[aeiou]/
end

# check if it's alphabetic
def alphabetic?(word)
    #checking if a word contains just the alphabet
    word[/[a-zA-Z]+/] == word
end

def word_fixing(word, original_word)
    # split it where the is a non-alphabetic character
    punctuation = {}
    word_chars = word.chars
    word_chars.each do |letter|
        # whe the letter is not alphabetic, then it's punctuation
        if !alphabetic?(letter)
            # user the original word' index (withought the 'ay') 
            # use that as the key for the actual letter
            # at this point letter is a punctuation mark
            punctuation[original_word.index(letter)] = letter
        end
    end    
    # get rid of the punctuation in the word wit the "ay" at the end
    result = word.split(/[^a-zA-Z]/).join()

    #    if punctuation at the begining like: 'abner        else add things like: ?
    #                                                    taking into cosideration the "ay" by adding +2
    punctuation.each {|k, v| k == 0 ? result.insert(0, v) : result.insert(k+2, v)}
    
    #words starting with: '. Example 'abner don't get capitalize wiht just .capitalize
    # get just the  abner  from: 'abner to be able to change it to:  'Abner
    if original_word[1..].capitalize == original_word[1..]
        # starting punctuation mark like: " or '
        begining_punc = result[0]
        result = result[1..].capitalize
        return begining_punc + result
    end
    result
end



def translate_one_word(s)
    first_v = first_vowel(s.downcase)
    # string to hold the final result
    if first_v == 0
        return s + "ay"
    end
    
    result = ""

    #check if it's a 'qu' if so, treat it like a consonant
    if s[first_v - 1] == 'q'
        # after the 'u' in 'qu'
        part1 = s[first_v + 1..]
        # from index 0 up to 'u' in 'qu'
        part2 = s[0..first_v]

        result = part1 + part2 + "ay"
    else
        #this are all the begining consonants
        part2 = s[0..first_v - 1]
        #from the first vowel up to the end
        part1 = s[first_v..]

        result = part1 + part2 + "ay"
    end # end nested if-else statement

    if s.capitalize == s
        return result.capitalize
    end
    result
end # end the function

def translate_words(arr)
    result = ""
    arr.each do |word|
        temp_word = translate_one_word(word)

        # if it contains other than alphabetic characters
        if !alphabetic?(temp_word)
            temp_word = word_fixing(temp_word, word)
        end
        result += temp_word + " "
    end
    # to eliminate the extra space to the right of result: " "
    result.strip
end

def translate(s)
    arr = s.split(" ")
    if arr.length == 1
        return translate_one_word(s)
    else
        return translate_words(arr)
    end
end
