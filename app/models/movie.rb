class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  before_destroy :check_for_bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  private

  def check_for_bookmarks
    raise ActiveRecord::InvalidForeignKey if bookmarks.any?
  end
end
