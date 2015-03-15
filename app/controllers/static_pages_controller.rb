class StaticPagesController < ApplicationController
  def new
  end

  def create
  	@handle = :handle
  	redirect_to word_cloud
  end
end
