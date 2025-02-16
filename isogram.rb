def is_isogram?(text)
  cleaned_text = text.downcase.gsub(/[^a-z]/, '') # Nettoyage du texte
  cleaned_text.chars.uniq.length == cleaned_text.length
end

puts "Bienvenue dans le vérificateur d'isogrammes !"
puts "Tapez un mot ou une phrase pour vérifier si c'est un isogramme."
puts "Tapez '-1' pour quitter."

loop do
  print "Entrez un mot ou une phrase : "
  input = gets.chomp.strip

  break if input == "-1"

  if is_isogram?(input)
    puts "'#{input}' est un isogramme ✅"
  else
    puts "'#{input}' n'est pas un isogramme ❌"
  end
end

puts "Programme terminé. À bientôt !"