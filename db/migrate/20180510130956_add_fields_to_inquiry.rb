class AddFieldsToInquiry < ActiveRecord::Migration[5.1]

def up

change_table :inquiries do |t|
  add_column :inquiries, :first_name, :string
  add_column :inquiries, :second_name, :string
  add_column :inquiries, :subject, :text
  add_column :inquiries, :message, :text
 
  end
end

end




