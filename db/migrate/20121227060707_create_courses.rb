class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :name
      t.text    :description
      
      t.date    :start_date
      t.date    :end_date
      
      t.integer :teacher_id
      t.integer :school_id
      
      t.timestamps
    end
  end
end
