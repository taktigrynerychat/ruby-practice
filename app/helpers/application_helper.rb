module ApplicationHelper
  def cp(path)
    "current" if current_page?(path)
  end

  def dt(locale)
    "current" if I18n.locale == locale
  end

end
