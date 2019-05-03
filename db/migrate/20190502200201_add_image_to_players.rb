class AddImageToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :image, :string, default: "default.png"
  end
end
