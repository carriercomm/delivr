class AddActiveItemsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :active, :boolean
  end
end
