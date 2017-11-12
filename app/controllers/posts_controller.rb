class PostsController < ApplicationController

    def index
      @post = Post.all
    end 

    def new 
      @post = Post.new 
    end

    def create
      @post = Post.new(post_params)
      if @post.save 
        flash[:info] = "Posts updated"
        redirect_to posts_path
      else
        flash[:info] = "Something went wrong, please try again." 
        redirect_to posts_path
      end 
    end 
    
  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
