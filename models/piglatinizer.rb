require 'pry'
class PigLatinizer 


    def seperate_string_into_words(words)
        words.split(' ')
    end

    def piglatinize(words)
        #binding.pry
        piglatin_string = []
        string = self.seperate_string_into_words(words)
        string.each do |word|
            punctuation = ""
            piglatin_word = ''
            if word.match(/\W$/)
                punctuation = word[-1]
                word.delete_suffix!(punctuation)
            end
            if word.match(/\A[aeiou]/i)
                piglatin_word = word + "way"
            elsif word.match(/\A[bcdfghjklmnpqrstvwxy]/i)
                begining_consanants = word.scan(/\A[^aeiou]+/i)[0]
                word_without_begining_consanats =  word.delete_prefix!(begining_consanants)
                piglatin_word = word_without_begining_consanats + begining_consanants + 'ay'
            end
            if punctuation != ""
                  piglatin_word += punctuation
            end
            piglatin_string << piglatin_word      
        end
        piglatin_string.join(' ')
    end

end