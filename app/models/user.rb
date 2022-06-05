class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum:25}
    validates :email, presence: true, uniqueness: true ,length: {maximum:25}, format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
end