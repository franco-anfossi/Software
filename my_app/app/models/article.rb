class Article < ApplicationRecord
    validates :titles, presence: true
    validates :body, presence: true
end
