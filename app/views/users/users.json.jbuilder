json.array! @users do |m|
	json.extract! m, :name, :email
end