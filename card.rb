class Card
  attr_accessor :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def to_s
    "#{@question} - #{@answer}"
  end
end
