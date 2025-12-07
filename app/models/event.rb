class Event < ApplicationRecord
  scope :this_week, -> { where(starts_at: Date.current.beginning_of_week..Date.current.end_of_week).order(:starts_at).limit(5) }
  scope :this_month_excluding_this_week, -> { where(starts_at: (Date.current.end_of_week + 1.day)..(Date.current.end_of_month)).order(:starts_at).limit(5) }
end
