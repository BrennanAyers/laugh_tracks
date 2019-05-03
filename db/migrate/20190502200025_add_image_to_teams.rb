class AddImageToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :image, :string, default: "default.png"
  end
end
