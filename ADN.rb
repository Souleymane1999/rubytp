def ADN_distance(adn1, adn2)

  raise ArgumentError, "Les séquences doivent avoir la même longueur" if adn1.length != adn2.length

  
  adn1.chars.zip(adn2.chars).count { |char1, char2| char1 != char2 }
end


adn1 = "GAGCCTACTAACGGGAT"
adn2 = "CATCGTAATGACGGCCT"

puts "Distance de ADN : #{ADN_distance(adn1, adn2)}"
