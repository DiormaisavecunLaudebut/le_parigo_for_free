class CreateArticleDossiers < ActiveRecord::Migration[5.2]
  def change
    create_table :article_dossiers do |t|
      t.references :article, foreign_key: true
      t.references :dossier, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
