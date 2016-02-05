class Note < ActiveRecord::Base
    validates_presence_of :rating
end