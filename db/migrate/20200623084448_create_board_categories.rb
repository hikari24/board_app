class CreateBoardCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :board_categories do |t|
    	t.integer :category_id
    	t.integer :board_id

      t.timestamps
    end
  end
end
