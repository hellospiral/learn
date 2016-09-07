class AddDumbProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :dumb, :boolean
  end
end
