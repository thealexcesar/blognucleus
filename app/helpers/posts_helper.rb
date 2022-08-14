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
  # ====================================================================================================================
  def post_categories # todo: most viwed!
    Post.all.where('top < 6').order('top ASC')
  end
end
