class DropBasketItems < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        drop_table :basket_items
      end

      dir.down do
        create_table :basket_items do |t|
          # Define table columns here
        end
      end
    end
  end
end
