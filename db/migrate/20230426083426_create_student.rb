class CreateStudent < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :birth_day
      t.string :address
      t.references :course
      t.timestamps
    end
  end
end
