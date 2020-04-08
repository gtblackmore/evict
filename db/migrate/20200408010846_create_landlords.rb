class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :company_name
      t.string :company_address
      t.string :company_city
      t.string :company_state
      t.string :company_zip
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_email
      t.string :contact_phone
    end
  end
end
