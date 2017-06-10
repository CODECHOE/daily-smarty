class StaticController < ApplicationController
  def homepage
    @page_title = 'DailySmarty | A Tool for Learning Something New Everyday'
    @posts = Post.page(params[:page]).per(5)
  end
end
