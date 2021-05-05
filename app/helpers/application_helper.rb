module ApplicationHelper
  def cp(path)
    "current" if current_page?(path)
  end
  #
  # def cg(cur, sel)
  #   logger.info "curr = #{cur}, sel = #{sel}"
  #   "current" if cur == sel
  # end
end
