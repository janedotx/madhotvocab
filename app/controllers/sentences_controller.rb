class SentencesController < ApplicationController

  #TODO If there's a conjugated word in the sentence, the other randoms should be conjugates of the same type too
  # TODO right now the only possible answer is the headword...we don't store which version of the word we're using anywhere
  
  def question
    @sentence = Sentence.find(params[:id].to_i)
    @word = @sentence.word
    @bait = []
    while @bait.size < NUM_ANSWER_CHOICES - 1
      id = rand(1...NUM_WORDS)
      next if id == @word.id
      @bait << Word.find(id)
    end
    @bait << @word
    @bait.shuffle!
  end

  def check
    # TODO get a before_filter for this
    @sentence = Sentence.find(params[:id].to_i)
    @answer = params[:word]
    render json: @sentence.check(@answer)
  end
end
