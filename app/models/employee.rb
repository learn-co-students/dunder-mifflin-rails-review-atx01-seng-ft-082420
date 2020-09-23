class Employee < ApplicationRecord
    belongs_to :dog

    validates(:title, {presence: true, uniqueness: true})
    validates(:alias, {uniqueness: true})

    def name
        "#{self.first_name} #{self.last_name}"
    end
end
