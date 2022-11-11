# == Schema Information
#
# Table name: to_dos
#
#  id         :integer          not null, primary key
#  content    :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class ToDo < ApplicationRecord
end
