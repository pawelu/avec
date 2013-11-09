class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.new(topic_params)
    topic.user = current_user
    if topic.save
      redirect_to topic_path(topic)
    else
      redirect_to new_topic_path
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.order_by(:created_at.desc)
  end

  private

    def topic_params
      params.require(:topic).permit(:name)
    end

end
