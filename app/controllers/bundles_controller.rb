class BundlesController < ApplicationController
  before_filter :set_word 

  def index
    render :text => "nothing here yet"
  end

  def sentences
    set_sentence_vars
    ask_sentence
  end

  def check
    # TODO get a before_filter for this
    @sentence = Sentence.find(params[:id].to_i)
    @answer = params[:word]
    render json: @sentence.check(@answer)
  end

  def analogies
    @analogy = @word.analogy
    @bait = []
    while @bait.size < NUM_ANSWER_CHOICES
      # this could be better...ought to be able to handle ID gaps
      id = rand(1...NUM_WORDS)
      next if id == @word.id
      @bait << Word.find(id).analogy.second_source
      @bait << Word.find(id).analogy.second_target
    end
    @bait << @analogy.root_target
    @bait << @analogy.second_source
    @bait << @analogy.second_target
    @bait.shuffle!
    render "bundles/analogies/question"
  end

  def about
  end

  private

  def set_word
    @word = Word.find(@user.bundle_progress.preview_next_word)
  end

  def ask_sentence
    render "bundles/sentences/question"
  end

  def set_sentence_vars
    # TODO fix this and keep track of sentences
    @sentence = @word.sentences[0]
    @bait = []
    while @bait.size < NUM_ANSWER_CHOICES - 1
      # this could be better...ought to be able to handle ID gaps
      id = rand(1...NUM_WORDS)
      next if id == @word.id
      @bait << Word.find(id)
    end
    @bait << @word
    @bait.shuffle!
  end
end
