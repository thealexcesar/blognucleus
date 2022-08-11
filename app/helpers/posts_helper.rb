module PostsHelper
  def badge_color status
    badge = "badge badge-pill bg"
    case status
    when "draft"
      "#{badge}-warning"
    when "published"
      "#{badge}-primary"
    end
  end
end
