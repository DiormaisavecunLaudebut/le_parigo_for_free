class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :date
      t.text :summary
      t.text :paragraph
      t.string :url
      t.boolean :read
      t.string :category

      t.timestamps
    end
  end
end
