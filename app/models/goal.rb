# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  body        :string           default(""), not null
#  visible     :boolean          default(TRUE), not null
#  user_id     :integer          not null
#  completed   :boolean          default(FALSE), not null
#  target_date :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ActiveRecord::Base
  validates(
    :title, :body, :private, :user_id,
    :target_date, :completed,
    presence: true
  )

  validates :title, :body, length: { maximum: 255 }
  validates :title, length: { minimum: 2 }

  after_initialize :ensure_visibilty


  belongs_to :user

def ensure_visibilty
  self.visibility ||= false
end


end
