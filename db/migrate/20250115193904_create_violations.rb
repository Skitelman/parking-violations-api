class CreateViolations < ActiveRecord::Migration[8.0]
  def change
    create_table :violations do |t|
      t.string :plate

      t.timestamps
    end
  end
end
