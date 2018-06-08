class TranslateProducts < ActiveRecord::Migration[5.1]
 
 def self.up
   Product.create_translation_table!({
          :title => :string,
          :description => :text,
          :price => :decimal
   }, {
     :migrate_data => true
   })
   end

  def self.down
   Product.drop_translation_table! :migrate_data => true
  end

 end
