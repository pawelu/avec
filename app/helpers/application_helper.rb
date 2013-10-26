module ApplicationHelper

  def format_date(time)
   if time.blank?
     '-'
   else
     time.strftime("%Y-%m-%d %H:%M")
   end
  end
end
