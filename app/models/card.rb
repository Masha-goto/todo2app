# == Schema Information
#
# Table name: cards
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  limit_date :date             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_cards_on_user_id  (user_id)
#
class Card < ApplicationRecord
	validates :name, presence: true
	validates :content, presence: true
	validates :content, uniqueness: true
	validates :limit_date, presence: true
	has_one_attached :eyecatch
	has_many :comments, dependent: :destroy
	belongs_to :user
end
