module ApplicationHelper
    # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def week(i)
    d = ["日","月","火","水","木","金","土"]
    return d[i]
  end

  def change(s)
    h = s.divmod(3600)
    m = h[1].divmod(60)
    return "#{h[0]}時間#{m[0]}分"
  end
end
