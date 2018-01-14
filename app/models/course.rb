class Course < ApplicationRecord
  has_many :lectures #has events too, but we dont need that for now
  has_many :events
end