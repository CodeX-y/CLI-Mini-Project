class Deck
  attr_accessor :flashcards

  def initialize
    @flashcards = []
  end

  def add_flashcard(flashcard)
    @flashcards << flashcard
  end
end
