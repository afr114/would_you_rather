class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :option_a_title, :string
      t.column :option_b_title, :string
      t.column :explanation, :text
      t.column :user_id, :integer

      t.timestamps null: false
    end
  end
end
