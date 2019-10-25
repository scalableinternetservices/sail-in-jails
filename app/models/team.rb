class Team < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: true }
  validates :desc, presence: true, length: { maximum: 1000 }
end
