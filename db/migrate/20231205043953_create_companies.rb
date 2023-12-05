class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :location
      t.string :sector
      t.integer :num_employees
      t.integer :company_employees_count

      t.timestamps
    end
  end
end
