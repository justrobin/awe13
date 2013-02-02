class Hangman
	attr_reader :wort
  def initialize(wort)
    @wort = wort.scan( /\w+/ )
  end
  def rateBuchstabe(char)
    
  end
  def showProgress()
    print wort
	end
end
