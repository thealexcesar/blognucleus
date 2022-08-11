module ApplicationHelper
  # ====================================================================================================================
  # === Filter ===
  def set_filter param, q, field
    form_tag(field, method: "get", class: "form-inline", role: "form") do
      text_field_tag param, params[param].nil? ? "" : params[param], class: "form-control mt-0 icon-search", placeholder: q.to_s
    end
  end

  def get_filter
    case params[:controller]
      when "posts"
        set_filter :title, t('filter.title'), posts_path
      when  "admin/posts"
        set_filter :title, t('filter.title'), posts_path
      when "admin/users"
        set_filter :name, t('filter.name'), admin_users_path
      else
        set_filter :search, "search...", "/"
      end
  end

  # ====================================================================================================================
  # === Translate model ===
  def editing_model
    model_name = controller_name.classify.underscore
    t("general.editing", model: t("activerecord.models.#{model_name}.one"))
  end
  def new_model
    model_name = controller_name.classify.underscore
    t("general.new_model", model: t("activerecord.models.#{model_name}.one"))
  end
  def new_model_f
    model_name = controller_name.classify.underscore
    t("general.new_model_f", model: t("activerecord.models.#{model_name}.one"))
  end

  def nl2br(text)
    unless text.blank?
      text = sanitize(text, tags: %w(a), attributes: %w(href data-toggle data-target data-remote))
      text.gsub(/\n/, '<br />').html_safe
    end
  end
end
# ======================================================================================================================