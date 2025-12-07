class StaticPageController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @birthday_members = ChurchMember.birthday_this_month
    @this_weeks_events = Event.this_week
    @this_months_events = Event.this_month_excluding_this_week
  end

  def about
  end
end
