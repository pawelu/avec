require 'uri'
module ApplicationHelper

  def format_datetime(datetime)
   datetime.strftime("%Y-%m-%d %H:%M") if datetime.present?
  end

  def format_date(datetime)
   I18n.l(datetime, :format => '%d %b %Y') if datetime.present?
  end

  def format_time(datetime)
    I18n.l(datetime, :format => '%H:%M') if datetime.present?
  end


  def remove_button(object)
    link_to 'Usuń', object, method: :delete, data: { confirm: 'Czy chcesz na pewno usunąć?' }, class: 'btn btn-danger'
  end

  def static_map_image_tag(address)
    options = {
      center: address,
      zoom: 15,
      size: '500x400',
      maptype: 'roadmap',
      sensor: false
    }

    querystring = options.each_pair.map{|pair| "#{pair.first}=#{pair.last}"}.join('&')
    image_tag "http://maps.googleapis.com/maps/api/staticmap?#{querystring}", alt: address
  end

  def link_to_map(address)
    link_to address, map_url(address), target: '_blank'
  end

  def map_url(address)
    "https://maps.google.pl/maps?q=#{address}"
  end
end
