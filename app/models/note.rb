class Note < ActiveRecord::Base
    validates_presence_of :rating
    belongs_to :wine
end