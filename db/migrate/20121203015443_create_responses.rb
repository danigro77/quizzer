class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :score
    
      t.integer :user_id
      t.integer :answer_id
      t.integer :quiz_id
    
      t.timestamps
    end
  end
end
