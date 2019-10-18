class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :desc, presence: true, length: { maximum: 1000 }
end
