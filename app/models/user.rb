class User < ApplicationRecord
  has_many :values, dependent: :destroy
  before_save { self.email = email.downcase }
end
