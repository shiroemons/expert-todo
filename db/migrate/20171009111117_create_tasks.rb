class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false, default: ''
      t.datetime :expired_at
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
