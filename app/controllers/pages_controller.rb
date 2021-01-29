class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :success, :terms]
  def home
  end

  def success
  end

  def terms
  end
end
