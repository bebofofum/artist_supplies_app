class CreateArtitem < ActiveRecord::Migration[6.0]
  def change
    create_table :art_items do |c|
      c.string :name
      c.string :description
      c.integer :author_id
    end

  end
end
