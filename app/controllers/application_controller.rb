class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    respond_to do |format|
      format.html { render file: Rails.root.join('public', '404.html'), layout: false, status: 404 }
    end
  end
end
