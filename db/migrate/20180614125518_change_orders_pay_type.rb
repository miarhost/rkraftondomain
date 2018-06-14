class ChangeOrdersPayType < ActiveRecord::Migration[5.1]

def up
 
 change_table :orders do |t|
   t.change :pay_type, :integer
  end

end

def down 

  change_table :orders do |t| 
   t.change :pay_type, :string
   t.change :integer, :string
  end

end   

end