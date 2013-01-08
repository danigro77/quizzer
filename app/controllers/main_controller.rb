class MainController < ApplicationController
  skip_filter :authenticated?
  def index
  end
end