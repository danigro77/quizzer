class CreateCoursesUsersJoin < ActiveRecord::Migration
  def change
    create_table :courses_users do |t|
      t.integer :course_id
      t.integer :user_id
      
      t.float :overall_score
      
      t.timestamps
    end
  end
end
