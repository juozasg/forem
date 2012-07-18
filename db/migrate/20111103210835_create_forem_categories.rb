class CreateForemCategories < ActiveRecord::Migration
  def change
    create_table :forem_categories do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
