def caesar_cipher(string, shift)
  all_chars = ("a".."z").to_a
  encrypted_string = ""
  string.each_char do |char|
    index = all_chars.find_index(char.downcase)
    unless index
      encrypted_string << char
      next
    end
    uppercase = char == char.upcase
    encrypted_index = index + shift
    rollover = encrypted_index % all_chars.length
    encrypted_index = rollover if rollover > 0
    encrypted_char = all_chars[encrypted_index]
    encrypted_char = encrypted_char.upcase if uppercase
    encrypted_string << encrypted_char
  end
  encrypted_string
end


puts caesar_cipher("What a string!", 5)