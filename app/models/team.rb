class Team < ApplicationRecord
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 100 }, 
                   uniqueness: { case_sensitive: false }
  validates :desc, presence: true, length: { maximum: 1000 }
end

