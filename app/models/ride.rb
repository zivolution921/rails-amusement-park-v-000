class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

   #is called on @ride instance
    #instantiated with @user_id => can get @user
    #instantiated with @attraction_id => can get @attraction
  def take_ride
    @user = User.find_by_id(self.user_id)
    @attraction = Attraction.find_by_id(self.attraction_id)
    ticket_limit = @user.tickets < @attraction.tickets
    height_limit = @user.height < @attraction.min_height

    if ticket_limit && height_limit 
      "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif ticket_limit
      "Sorry. You do not have enough tickets the #{@attraction.name}."
    elsif height_limit
      "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else #no ticket_limit or height_limit
      @user.update(
        :tickets => (@user.tickets - @attraction.tickets),
        :nausea => (@user.nausea + @attraction.nausea_rating),
        :happiness => (@user.happiness + @attraction.happiness_rating),
        )
    end
  end
      
end