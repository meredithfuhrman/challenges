def translate(sentence)
  translated = []
  words = sentence.split(" ")
  words.each do |word|
    #if the word starts with a vowel
    if word[0].match(/a|e|i|o|u/)
      translated << word.concat("way")
    #if the word starts with a consonant
    else
      first_vowel = word.index(/a|e|i|o|u/) #finds first vowel
      append = word[0..first_vowel - 1].concat("ay")
      translated << word[first_vowel..-1].concat(append)
    end
  end
  translated.join(" ")
end

input = ARGV.join(" ")
puts translate(input)
