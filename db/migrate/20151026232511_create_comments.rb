class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.column :user_id, :integer
      t.column :post_id, :integer

      t.timestamps null: false
    end
  end
end
