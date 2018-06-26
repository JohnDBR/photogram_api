class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]

  def index
    render_ok Post.all
  end

  def create
    post = Post.new(user_id:@current_user.id, title:params[:title], description:params[:description])
    if_save_succeeds(post) do |object|
      if not params[:image].nil?
        trans = Transmission.new
        if trans.create_picture(params, post)
          render_ok post
        else
          render_unprocessable({post: post, errors: trans.errors})
        end
      else
        render_ok post
      end
    end
  end

  def destroy
    render_ok @post.destroy
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
