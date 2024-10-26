class AddDetailsToCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :categories, :details, :string, default: "A category for tasks"
  end
end
