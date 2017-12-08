class Task < ApplicationRecord
	acts_as_commentable
	belongs_to :project
	belongs_to :user
	has_many :task_reasons
	validates_presence_of :name

end
