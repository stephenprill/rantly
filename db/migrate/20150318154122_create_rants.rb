class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title
      t.string :body
      t.belongs_to :user
      t.timestamps
    end
  end
end
