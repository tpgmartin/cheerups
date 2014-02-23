class Cheerup < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :cheerup_votes

  def self.by_votes
    select('cheerups.*, coalesce(value, 0) as votes').joins('left join cheerup_votes on cheerup_id=cheerups.id').order('votes desc')
  end

  def votes
    read_attribute(:votes) || cheerup_votes.sum(:value)
  end
end
