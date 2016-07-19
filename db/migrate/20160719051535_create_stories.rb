class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.string :authorName
      t.text :heading
      t.text :body
      t.boolean :published

      t.timestamps null: false
    end
  end
end
