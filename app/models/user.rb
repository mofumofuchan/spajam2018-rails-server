class User < ApplicationRecord
  has_many :objectives, dependent: :destroy
end
