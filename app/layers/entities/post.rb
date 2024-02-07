# frozen_string_literal: true

require 'dry-struct'

# Types
module Types
  include Dry.Types()
end

module Entities
  # Entities::Post
  class Post < Dry::Struct
    transform_keys(&:to_sym)

    attribute :id, Types::Strict::Integer
    attribute :title, Types::Strict::String
    attribute :body, Types::Strict::String
  end
end
