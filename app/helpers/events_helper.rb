module EventsHelper
  def format_date(datetime)
    if datetime.blank?
      '-'
    else
      I18n.l time, format: :short
    end
end
end
