class CheerupVote < ActiveRecord::Base
  attr_accessible :cheerup, :cheerup_id, :value

  belongs_to :cheerup
  belongs_to :user

  validates_uniqueness_of :cheerup_id, scope: :user_id
  validates_inclusion_of :value, in: [1 , -1]
  # Not required in final version
  validate :ensure_not_author 

  def ensure_not_author
    errors.add :user_id, "is the author of the cheerup" if cheerup.user_id == user_id
  end
end
