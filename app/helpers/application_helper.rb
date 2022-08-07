module ApplicationHelper
  def editing_model
    model_name = controller_name.classify.underscore
    t("general.editing", model: t("activerecord.models.#{model_name}"))
  end
  def new_model
    model_name = controller_name.classify.underscore
    t("general.new_model", model: t("activerecord.models.#{model_name}"))
  end
  def new_model_f
    model_name = controller_name.classify.underscore
    t("general.new_model_f", model: t("activerecord.models.#{model_name}"))
  end
end
