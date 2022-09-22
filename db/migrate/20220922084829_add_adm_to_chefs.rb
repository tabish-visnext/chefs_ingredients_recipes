class AddAdmToChefs < ActiveRecord::Migration[7.0]
  def change
    add_column :chefs, :adm, :boolean, default: false
  end
end
