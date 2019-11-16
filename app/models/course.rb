class Course < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: true }
end
