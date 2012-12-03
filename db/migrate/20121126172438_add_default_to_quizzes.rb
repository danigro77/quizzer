class AddDefaultToQuizzes < ActiveRecord::Migration
  def change
    change_column :quizzes, :active, :boolean, :default => false
  end
end
