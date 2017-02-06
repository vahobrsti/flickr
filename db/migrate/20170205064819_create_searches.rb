class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :phrase

      t.timestamps
    end
  end
  create_table :searches_users, id: false do |t|
    t.belongs_to :user, index: true
    t.belongs_to :search, index: true
  end
end
