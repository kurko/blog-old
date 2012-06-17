module ApplicationHelper
  def form_action
    if ["new", "create"].include? params[:action]
      "create"
    elsif ["edit", "update"].include? params[:action]
      "update"
    end
  end
end
