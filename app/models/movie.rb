class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    throw(:abort) if bookmarks.any?
  end
end
