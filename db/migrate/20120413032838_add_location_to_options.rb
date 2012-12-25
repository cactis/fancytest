# -*- encoding : utf-8 -*-
class AddLocationToOptions < ActiveRecord::Migration
  def change
    add_column :options, :location, :float
    add_column :options, :discrimination, :float
    add_column :options, :pseudo_chance, :float

    add_index :options, :location
    add_index :options, :discrimination
    add_index :options, :pseudo_chance
  end
end
