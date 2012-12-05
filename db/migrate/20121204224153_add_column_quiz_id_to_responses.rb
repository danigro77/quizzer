class AddColumnQuizIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :quiz_id, :integer
  end
end
