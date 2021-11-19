def substrings(phrase, dictionary)
  # normalize phrase and dictionalry words (later) do lower case
  phrase = phrase.downcase
  # reduce the dictionary arrray to a hash containing words and their counts
  dictionary.inject({}) do |acc, word|
    # find all occurences of word with scan
    count = phrase.scan(word.downcase).length
    # add count to hash
    acc[word] = count if count > 0
    acc # return hash for next iteration
  end
end
