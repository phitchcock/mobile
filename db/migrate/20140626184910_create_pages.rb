class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.belongs_to :site

      t.timestamps
    end
  end
end
