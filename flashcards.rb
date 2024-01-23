require_relative 'card'
require_relative 'deck'

class Flashcards
  def initialize
    @deck = Deck.new
  end

  private

  attr_reader :deck # Add this line for testing purposes

  public

  def run
    loop do
      puts "\nFlashcard CLI - Welcome!"
      puts "1. View Flashcards  2. Quiz Yourself  3. Add Flashcard  4. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i

      case option
      when 1
        view_flashcards
      when 2
        quiz_yourself
      when 3
        add_flashcard
      when 4
        puts "Thank you for using the Flashcard CLI. Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def view_flashcards
    if @deck.flashcards.empty?
      puts "No flashcards in the deck. Add flashcards first."
      return
    end

    puts "Flashcards in the deck:"
    @deck.flashcards.each do |flashcard|
      puts flashcard
    end
  end

  def quiz_yourself
    if @deck.flashcards.empty?
      puts "No flashcards available for the quiz. Add flashcards first."
      return
    end

    puts "Quiz Yourself!"
    total_flashcards = @deck.flashcards.length
    correct_answers = 0

    @deck.flashcards.shuffle.each do |flashcard|
      puts "\nQuestion: #{flashcard.question}"
      print "Your Answer: "
      user_answer = gets.chomp
  
      if user_answer.downcase == flashcard.answer.downcase
        puts "Correct!"
        correct_answers += 1
      else
        puts "Incorrect. The correct answer is: #{flashcard.answer}"
      end
    end

    puts "\nQuiz Summary:"
    puts "Correct Answers: #{correct_answers}/#{total_flashcards}"
  end

  def add_flashcard
    print "Enter question: "
    question = gets.chomp
    print "Enter answer: "
    answer = gets.chomp
    @deck.add_flashcard(Card.new(question, answer))
    puts "Flashcard added successfully!"
  end
end
