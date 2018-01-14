class User < ApplicationRecord
  has_many :lectures
  has_many :events
end
