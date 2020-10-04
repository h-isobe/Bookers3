class AddPrefectureToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :prefecture, :integer, null: false, default: "0"
  end
end
