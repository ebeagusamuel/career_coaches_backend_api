class CreateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :location
      t.string :qualification
      t.string :charge_per_hour

      t.timestamps
    end
  end
end
