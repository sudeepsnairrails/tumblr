class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @post  = Post.find(params[:post_id])
        puts "----"
        puts @post
        puts "----"
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@post)
    end

    def destroy
        puts "======="
        puts params
        puts "======="
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to post_path(@post)
    end
end
