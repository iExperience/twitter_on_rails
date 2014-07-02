# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

admin = User.create!(:handle => "iXperienceCT", :email => "staff@ixperience.co.za", :password => "pass", :password_confirmation => "pass", :role => "admin")
user = User.create!(:handle => "daretorant", :email => "me@daretorant.com", :password => "pass", :password_confirmation => "pass", :role => "user")

Tweet.destroy_all

["hey there whats up", "this is some test work", "i like to tweet tweet", "go team", "how about that local sports team", "i heard they won"].each do |body|
  Tweet.create!(:body => body, :user => user)
end

["i am an admin", "therefore i rule", "lolz"].each do |body|
  Tweet.create!(:body => body, :user => admin)
end

