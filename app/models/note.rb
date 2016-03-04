class Note < ActiveRecord::Base
    validates_presence_of :rating, :user_id
    belongs_to :wine
    belongs_to :user
end