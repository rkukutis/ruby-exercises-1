require 'benchmark'

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(word, valid_substring_array)
  count_hash = Hash.new(0)
  valid_substring_array.each do |substring|
    substring_count = word.downcase.scan(substring).length
    count_hash[substring] = substring_count unless substring_count.zero?
  end
  count_hash
end

def substrings_manual(word, valid_substring_array)
  count_hash = Hash.new(0)
  word_chars = word.downcase.chars
  # Go over each searched substring
  valid_substring_array.each do |substring|
    substrings_chars = substring.downcase.chars
    occurrence_number = 0
    # Go over each char in containing string
    word_chars.each_with_index do |word_char, index|
      matched_chars = 0
      # if a char matches the first letter of substring, check if the remaining chars match
      if word_char == substrings_chars[0]
        substrings_chars.each_with_index do |substring_char, substring_char_index|
          break if (index + substring_char_index) == word.length - 1
          matched_chars += 1 if word_chars[index + substring_char_index] == substring_char
        end
      end
      occurrence_number += 1 if matched_chars == substring.length
    end
    count_hash[substring] = occurrence_number unless occurrence_number.zero?
  end
  count_hash
end

res1 = {}
res2 = {}

time2 = Benchmark.measure do
  res2 = substrings_manual("Howdy partner, sit down! How's it going?", dictionary)
end

time1 = Benchmark.measure do
  res1 = substrings("Howdy partner, sit down! How's it going?", dictionary)
end

puts res1 == res2
puts time1 # 0.000016
puts time2 # 0.000078 :(
