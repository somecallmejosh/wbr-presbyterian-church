class Gallery < ApplicationRecord
  has_many :photos, -> { order(:position) }, dependent: :destroy
  validates :title, presence: true
end
