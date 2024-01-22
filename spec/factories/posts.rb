# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'Learning Rabbitmq' }
    body  { 'In this blog post you will learn how to implement a blog app using the event sourcing with Rabbitmq' }
  end
end
