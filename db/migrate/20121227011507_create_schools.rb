class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string  :name
      
      t.string  :address_1
      t.string  :address_2
      t.string  :city
      t.string  :state
      t.integer :zip
      t.string  :country
      
      t.string  :url
      t.string  :email
      t.string  :contact
      
      t.timestamps
    end
  end
end
