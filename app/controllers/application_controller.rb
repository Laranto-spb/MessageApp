# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
    @current_user ||= User.find(1)
  end
end
