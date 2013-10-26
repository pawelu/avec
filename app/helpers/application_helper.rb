module ApplicationHelper

  def format_datetime(datetime)
   datetime.strftime("%Y-%m-%d %H:%M") if datetime.present?
  end

  def format_date(datetime)
   datetime.strftime("%Y-%m-%d") if datetime.present?
  end

  def format_time(datetime)
    datetime.strftime("%H:%M") if datetime.present?
  end
end
