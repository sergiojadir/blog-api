# frozen_string_literal: true

module Repositories
  # Repositories::PostRepository
  class PostRepository
    attr_reader :model

    def initialize(klasses: {})
      @model = klasses.fetch(:model) { Post }
    end

    def create(params)
      post = model.create(params)

      if post.valid?
        [:ok, post_entity(post)]
      else
        [:failure, post.errors]
      end
    end

    private

    def post_entity(post)
      ::Entities::Post.new(
        id: post.id,
        title: post.title,
        body: post.body
      )
    end
  end
end
