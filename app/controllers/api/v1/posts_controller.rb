
class Api::V1::PostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        respond_to do |format|
            format.json { render(json: Post.all) }
          end
    end
  

    def show
        respond_to do |format|
           format.json { render(json: Post.find(params[:id]) ) }
         end
    end

    def create
        post = Post.new(posts_params)
        if post.save
            render json: post, status: 201
        else
            render json: { errors: post.errors}, status: 422
        end
    end

    def update
        post = Post.find(params[:id])
        if post.update(posts_params)
            render json: post, status: 201
        else
            render json: { errors: post.errors}, status: 422
        end

    end

    def destroy
        post = Post.find(params[:id])
        if post.destroy
            render json: post, status: 200
        else
            render json: { errors: post.errors}, status: 422
        end  
    end


    private

    def posts_params
        params.permit(:title, :body)
    end
end