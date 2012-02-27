def palindrome?(phrase)
  stripped_phrase = phrase.downcase.gsub(/[^a-z]/, '')
  stripped_phrase == stripped_phrase.reverse
end

def count_words(phrase)
  count = {}
  phrase.downcase.gsub(/[^a-z\s]/, '').split(/\b/).reject{|word| word.strip.empty?}.collect{|word| count[word].nil? ? count[word] = 1 : count[word] += 1}
  count
end