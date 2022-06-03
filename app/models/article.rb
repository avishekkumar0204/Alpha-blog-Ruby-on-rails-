class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5, maximum: 50}
    validates :desc, presence: true, length: {minimum: 8, maximum: 500}
end