class PostsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end

  def create
    topic = Topic.find(params[:topic_id])
    post = topic.posts.build(post_params)
    post.user = current_user

    post.save

    redirect_to topic_path(topic)
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
