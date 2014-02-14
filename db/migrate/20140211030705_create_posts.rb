class CreatePosts < ActiveRecord::Migration
	# TD QUESTION 2/13/14
	# What is ActiveRecord?
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
