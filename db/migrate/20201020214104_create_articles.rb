class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end

#migrations são salvas no formato YYYYMMDDHHMMSS para sempre identificar a ordem
#em que foram feitas
