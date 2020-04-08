# frozen_string_literal: true

class Callable
  extend Dry::Initializer

  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError
  end
end
