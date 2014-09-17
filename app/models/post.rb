class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true
	acts_as_votable
end
