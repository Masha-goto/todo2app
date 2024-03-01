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
require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
