module ApplicationHelper
  def prev_url?
    params[:offset].to_i > 0
  end

  def prev_url(per_page = 20)
    offset = params[:offset].to_i - per_page
    { offset: offset }
  end

  def next_url(per_page = 20)
    offset = params[:offset].to_i + per_page
    { offset: offset }
  end
end
