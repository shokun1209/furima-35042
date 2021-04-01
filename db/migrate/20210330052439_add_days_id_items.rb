class AddDaysIdItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delivery_id, :integer, null: false
  end
end
