class CreateExcuses < ActiveRecord::Migration
  def change
    create_table :excuses do |t|
      t.integer :quiz_id
      t.integer :user_id
      
      t.string  :reason
      
      t.timestamps
    end
  end
end
