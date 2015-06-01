class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.string :url
      t.string :app_name
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :registered_applications, :users
  end
end
