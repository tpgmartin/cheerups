class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates_uniqueness_of :name

  has_many :cheerups
  has_many :cheerup_votes

  def total_votes
    CheerupVote.joins(:cheerup).where(cheerups: {user_id: self.id}.sum('value'))
  end

  def can_vote_for?(cheerup)
    cheerup_votes.build(value: 1, cheerup: cheerup).valid?
  end
end
