class Event
	include Mongoid::Document
  	include Mongoid::Timestamps

  	has_and_belongs_to_many :users

	field :name,			type: String, default: ""
	validates_presence_of	:name
  	field :location,        type: String, default: ""
  	validates_presence_of	:location
	field :date,            type: String, default: ""
	validates_presence_of	:date
	field :description,		type: String, default: ""
	field :fees,			type: Integer


	def self.add_new(n_params)
		@event = Event.create(n_params)
		@event
	end

	def update_user(p_params)
		user = User.find(p_params[:user_id])
		if p_params[:presence] == "true"
			self.users << user
			user.events << self
			self.save
		else
			self.users.delete(User.find(user.id))
			user.events.delete(Event.find(self.id))
			self.save
			user.save
		end
		return true
	end
end