module Qwubble
  module Models
    class Question < ::Sequel::Model
      one_to_many :answers
    end
  end
end