class CreateLabelings < ActiveRecord::Migration[6.0]
  def change
    create_table :labelings do |t|
      t.references :post, foreign_key: true
      t.references :label, foreign_key: true
      t.timestamps
    end
  end
end
