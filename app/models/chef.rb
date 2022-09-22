class Chef < ApplicationRecord
    has_many :recipes, dependent: :destroy
    has_secure_password

    has_many :comments, dependent: :destroy

    validates :password, presence: true
end