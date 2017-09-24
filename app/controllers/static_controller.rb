class StaticController < ApplicationController
  def homepage
    @page_title = 'DailySmarty | A Tool for Learning Something New Everyday'

    if current_user
      hfs = HomepageFeedService.new(user: current_user)
      @posts = hfs.feed_query.page(params[:page]).per(20)
      render 'static/feed'
    else
      @topics = Topic.top_ten
    end
  end

  def profile
    @user = User.friendly.find(params[:id])

    if @user == current_user
      @posts = @user.posts.page(params[:page]).per(20)
    else
      @posts = @user.posts.published.page(params[:page]).per(20)
    end
  end

  def privacy_policy
  end

  def terms_conditions
  end

  def popular
    @posts = Post.where.not(impressions_count: nil)
               .published
               .where(created_at: (Date.today - 7.days)..Date.today)
               .order('impressions_count DESC')
               .page(params[:page])
               .per(42)
  end
end
