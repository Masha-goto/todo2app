class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
			t.references :user, null: false
			t.references :card, null: false
			t.text :content, null: false
      t.timestamps
    end
  end
end
