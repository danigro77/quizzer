class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string  :name
      t.integer :num_answers
      t.boolean :active, :default => false
      
      t.integer :course_id
      
      t.timestamps
    end
  end
end
