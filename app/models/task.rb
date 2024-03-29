# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
class Task < ApplicationRecord
	validates :name, presence: true
	validates :content, presence: true
	validates :content, uniqueness: true

	belongs_to :user

	def author_name
		user.display_name
	end
end
