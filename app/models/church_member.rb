class ChurchMember < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  scope :birthday_this_month, -> { where("EXTRACT(MONTH FROM date_of_birth) = ?", Date.current.month).order(:last_name, :first_name) }
end
