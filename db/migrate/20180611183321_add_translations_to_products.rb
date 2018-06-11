class AddTranslationsToProducts < ActiveRecord::Migration[5.1]

def up 
 change_table :products do |t|
  add_column :products, :title_ru, :string
  add_column :products, :description_ru, :string
  add_column :products, :price_ru, :decimal
 end
end

end

