class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  def after_sign_in_path_for(resource)
    posts_path
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
  end
  def set_search
    if params[:q] != nil
      params[:q]['title_cont_any'] = params[:q]['title_cont_any'].split(/[\p{blank}\s]+/)
      @q = Post.ransack(params[:q])
      @posts = @q.result.order(created_at: :desc).page(params[:page]).per(10)
    else
      @q = Post.ransack(params[:q])
      @posts = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
    end
  end
end
