# frozen_string_literal: true

module V1
  # V1::PostsController
  class PostsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound do
      render json: { message: 'Not found' }, status: :not_found
    end

    def index
      @posts = Post.all

      render json: @posts, status: :ok
    end

    def create
      @post = Post.create(create_params)

      # Publish post data
      Publisher.publish('posts', @post.attributes)

      render json: @post, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: e.record.errors, status: :not_found
    end

    def show
      @post = Post.find(params[:id])

      render json: @posts, status: :found
    end

    def destroy
      Post.find(params[:id]).destroy

      render json: { message: 'Deleted!' }, status: :ok
    end

    private

    def create_params
      params.require(:post).permit(:title, :body)
    end
  end
end
