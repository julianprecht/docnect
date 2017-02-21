class StaticPagesController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_valid

  def home
  end

  def about
  end

  def contact
  end
end
