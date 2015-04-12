class StaticPagesController < ApplicationController
  def home
  end

  def create
  	@handle = :handle
  	redirect_to word_cloud
  end
end
