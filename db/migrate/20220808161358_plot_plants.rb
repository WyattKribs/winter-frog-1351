class PlotPlants < ActiveRecord::Migration[5.2]
  def change
    add_reference :plants, :plots, foreign_key: true
    add_reference :plots, :plants, foreign_key: true 
  end
end
