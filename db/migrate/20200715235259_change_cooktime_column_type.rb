class ChangeCooktimeColumnType < ActiveRecord::Migration
  change_column :recipes, :cook_time, :text
end
