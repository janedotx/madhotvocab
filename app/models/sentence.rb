class SentenceValidator < ActiveModel::Validator
  def validate(record)
    unless record.lives >= 0 && record.lives <= 4
      record.errors[:lives] << 'Wrong number of lives!'
    end
  end
end

class Sentence < ActiveRecord::Base
  belongs_to :word
  # attr_accessible :title, :body

  def check(answer)
    if word.headword == answer
      return word.headword
    elsif word.conjugates.nil?
      return nil
    else
      if word.conjugates.split(/,/).include?(answer)
        answer
      else
        nil
      end
    end
  end

  def to_s
    part_1 + "____" + part_2
  end
end
