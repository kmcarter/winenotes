class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :rating
      t.text :tasting_notes
      
      t.timestamps
    end
  end
end
