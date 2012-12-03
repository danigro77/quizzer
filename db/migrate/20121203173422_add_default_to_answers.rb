class AddDefaultToAnswers < ActiveRecord::Migration
  def change
    change_column :answers, :correct, :boolean, :default => false
  end
end
