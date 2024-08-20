class ChangeNameToPetTipe < ActiveRecord::Migration[7.1]
  def change
    rename_column :pets, :type, :kind
  end
end
