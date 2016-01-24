module ApplicationHelper
  def data_in_out
    %w(fade left right top bottom)
  end

  def original_url
    request.base_url + request.original_fullpath
  end

  def br(count)
    count.times.map{'<br/>'}.join('').html_safe
  end
end
