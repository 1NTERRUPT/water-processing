class CreatePumpStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :pump_statuses do |t|
      t.integer :reserves
      t.integer :temperature
      t.integer :operating_at

      t.timestamps
    end
  end
end
