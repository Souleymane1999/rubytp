def is_isogram?(phrase)
  seen = {} 
  phrase.downcase.each_char do |char|
    next if char == ' ' || char == '-' 
    return false if seen[char]
    seen[char] = true
  end
  true
end


puts is_isogram?("background")    # true
puts is_isogram?("isogram")       # true
puts is_isogram?("hello")         # false
puts is_isogram?("six-year-old")  # true
