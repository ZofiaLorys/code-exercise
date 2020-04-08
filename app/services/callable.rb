# frozen_string_literal: true

class Callable
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError
  end
  end
