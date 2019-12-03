class Course < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: true }
  def expire_cache
    ActionController::Base.new.expire_fragment(‘profile_page’)
    ActionController::Base.new.expire_fragment(‘team_pages’)
  end
end