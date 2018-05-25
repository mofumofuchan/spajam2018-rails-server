class User < ApplicationRecord
  validates :name, length: { minimum: 3 }
end
