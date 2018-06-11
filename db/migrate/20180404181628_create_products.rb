class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :image_url
      t.timestamps
    end

    reversible do |dir|
     dir.up do
     Product.create_translation_table! :title => :string, :description => :text, :price => :decimal
     end

     dir.down do
     Product.drop_translation_table!
     end
   end
 end