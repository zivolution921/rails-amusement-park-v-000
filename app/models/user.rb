class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  

  def mood
    #sad if nausea > happiness
    #happy if happiness > nausea
    if self.happiness && self.nausea
      self.happiness > self.nausea ? "happy" : "sad"
    end
  end

end