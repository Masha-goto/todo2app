class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
			t.references :user, null: false
			t.string :name, null: false
			t.text :content, null: false
			t.date :limit_date, null: false
      t.timestamps
    end
  end
end
