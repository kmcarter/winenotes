class NoteReferencesWine < ActiveRecord::Migration
  def change
    add_reference :notes, :wine, index: true, foreign_key: true
  end
end
