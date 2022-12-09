class CreateScrapes < ActiveRecord::Migration[6.1]
  def change
    create_table :scrapes do |t|

      t.timestamps
    end
  end
end
