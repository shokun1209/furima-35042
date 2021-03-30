class AddDaysIdItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :days_id, :integer
  end
end
