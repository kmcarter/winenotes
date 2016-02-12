class Wine < ActiveRecord::Base
    has_many :notes, dependent: :destroy
end