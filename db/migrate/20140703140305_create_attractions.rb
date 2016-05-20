class CreateAttractions < ActiveRecord::Migration
 # Write your migrations here
 def change
  create_table :attractions do |t|
    t.string  :name
    t.integer :min_height
    t.integer :nausea_rating
    t.integer :hapiness_rating
    t.integer :tickets
  end
 end
end
