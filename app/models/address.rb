class Address < ApplicationRecord
    belongs_to :user, optional: true

    validates :city, :house_number, :postal_code, presence: true

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
end
