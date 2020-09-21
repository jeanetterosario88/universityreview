class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :score
      t.integer :user_id
      t.integer :university_id

      t.timestamps
    end
  end
end
