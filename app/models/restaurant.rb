class Restaurant < ApplicationRecord
    has_many :menu_item

    validates :name :address presence: true
end
