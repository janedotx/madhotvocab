class Word < ActiveRecord::Base
  # TODO add part of speech so it makes conjugates easier to deal with?
  # attr_accessible :title, :body
  has_many :sentences
  has_one :analogy
end
