class UserValidator < ActiveModel::Validator
  def validate(record)
    unless record.lives >= 0 && record.lives <= 4
      record.errors[:lives] << 'Wrong number of lives!'
    end
  end
end

class User < ActiveRecord::Base
  has_one :bundle_progress

  include ActiveModel::Validations
  validates_with UserValidator

  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create

  after_create :add_bundle_progress
  
  # attr_accessible :title, :body
  def reset_life
    self.lives = 4
    save
  end

  def lose_life
    self.lives = self.lives - 1
    save
  end

  private

  def add_bundle_progress
    bp = BundleProgress.new
    bp.user_id = self.id
    bp.current_stage = 0
    bp.reset_words_seen(self.current_bundle)
    bp.save
  end
end
