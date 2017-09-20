class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { minimum: 1 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 1 }

  def full_name
    return "#{ first_name } #{ last_name }"
  end
end
