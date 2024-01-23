require 'minitest/autorun'
require './flashcards.rb'
require './card.rb'
require './deck.rb'

class TestFlashcards < Minitest::Test
  def test_deck
    deck = Deck.new
    deck.add_flashcard(Card.new("What is the capital of France?", "Paris"))

    expected_output = "Flashcards in the deck:\n"\
                      "What is the capital of France? - Paris\n"

    assert_output(expected_output) do
      # Print the flashcards in the deck
      puts "Flashcards in the deck:"
      deck.flashcards.each do |flashcard|
        puts flashcard.to_s
      end
    end
  end
end
