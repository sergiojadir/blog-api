# frozen_string_literal: true

module Interactors
  # Interactors::CreatePost
  class CreatePost
    attr_reader :post_repo

    def initialize(post_repo:)
      @post_repo = post_repo
    end

    def execute(params)
      post_repo.create(params)
    end
  end
end
