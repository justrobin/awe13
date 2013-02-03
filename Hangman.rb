class Hangman
  @@input
  @@wort = []
  @@geraten = []
  @@zuraten = []
  @@erraten = false
  def initialize(wort)
		if(erlaubterString(wort))
   		@@wort = wort.scan(/./)
			i = 0
    	while i < wort.length-1
    	  @@zuraten[i] = "_ "
    	  i += 1
    	end
		else
			print "Es sind nur Buchstaben (keine Zahlen und Sonderzeichen) erlaubt.\n"
  		print "Loesungswort: "; @@input = gets	
  		hangman = Hangman.new(@@input.upcase)
    end
  end

  def zeigeFortschritt()
    i = 0
    while i < @@zuraten.length
      print "#{@@zuraten[i]}"
      i += 1
    end
    print "\ngeratene Buchstaben: #{@@geraten}\n"
	end

	def erlaubterString(s)
		valid = true
		i = 0
		while i < s.chomp.length
			if ((s.scan(/[a-zA-Z]/))[i]).class == NilClass
				valid = false
			end
			i += 1
		end
		return valid
	end

  def neuesZeichen(char)
		if(erlaubterString(char))
    	if @@wort.include?(char)
				i = 0
				while i < @@wort.length
					if @@wort[i] == char
						@@zuraten[i] = char +" "
					end
					i += 1
				end
    	  if !@@zuraten.include?("_ ")
					@@erraten = true
					print "Geloest! Gratulation.\nDas Wort lautet:\n"
				end
    	else
				if(!@@geraten.include?(char))
  	  		@@geraten.push(char)
					if @@geraten.length == 1
						print "         \n"
						print "         \n"
							print "         \n"
						print "         \n"
						print "         \n"
						print " _____  \n"
						print "\/     \\  \n"
					elsif @@geraten.length == 2
						print "         \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print " __|__   \n"
						print "\/     \\  \n"
					elsif @@geraten.length == 3
						print "         \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print " _/|\\_   \n"
						print "/     \\  \n"
					elsif @@geraten.length == 4
						print "   ----- \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print " _/|\\_   \n"
						print "/     \\  \n"
					elsif @@geraten.length == 5
						print "   ----- \n"
						print "   |/  | \n"
						print "   |     \n"
						print "   |     \n"
						print "   |     \n"
						print " _/|\\_   \n"
						print "/     \\  \n"
					elsif @@geraten.length == 6
						print "   ----- \n"
						print "   |/  | \n"
						print "   |   o \n"
						print "   |     \n"
						print "   |     \n"
						print " _/|\\_   \n"
						print "/     \\  \n"
					elsif @@geraten.length == 7
						print "   ----- \n"
						print "   |/  | \n"
						print "   |   o \n"
						print "   |   | \n"
						print "   |     \n"
						print " _/|\\_   \n"
						print "/     \\  \n"
					elsif @@geraten.length == 8
						print "   ----- \n"
						print "   |/  | \n"
						print "   |   o \n"
						print "   |  -|-\n"
						print "   |     \n"
						print " _/|\\_   \n"
						print "/     \\  \n"
					elsif @@geraten.length == 9
						print "   ----- \n"
						print "   |/  | \n"
						print "   |   o \n"
						print "   |  -|-\n"
						print "   |  / \\\n"
						print " _/|\\_   \n"
						print "/     \\  \n"
						print "Verloren!\n"
						print "Das Wort waere \"#{@@input.chomp}\" gewesen.\n"
						exit
						@@erraten = true
					end
				elsif
					print "Buchstabe bereits geraten.\n"
				end
			end
		else
			print "Es sind nur Buchstaben (keine Zahlen und Sonderzeichen) erlaubt.\n"
    end
  end

  print "Loesungswort: "; @@input = gets	
  hangman = Hangman.new(@@input.upcase)

  while !@@erraten
    print "\nBuchstabe: "
    char = gets
    if char.length == 2
      hangman.neuesZeichen((char.chomp).upcase)
    else
      print "Immer genau einen Buchstaben eingeben!\n"
    end
    hangman.zeigeFortschritt()
  end
end
