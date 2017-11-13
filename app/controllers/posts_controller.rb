class PostsController < ApplicationController
    before_action :only_logged_in, only: [:new, :create]

    def index
      @post = Post.all
    end 

    def new 
      @post = Post.new 
    end

    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      @post.author = current_user.name
      if @post.save 
        flash[:info] = "Posts updated"
        redirect_to posts_path
      else
        flash[:info] = "Something went wrong, please try again." 
        redirect_to posts_path
      end 
    end 
    
  private

    def only_logged_in
      unless logged_in?
        flash[:info] = "You must be logged in to make a new post."
        redirect_to login_path
      end
    end 


    def post_params
      params.require(:post).permit(:title, :body)
    end

end
