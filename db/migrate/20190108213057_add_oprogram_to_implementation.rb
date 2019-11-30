class AddOprogramToImplementation < ActiveRecord::Migration[4.2]
  def change
    add_reference :implementations, :oprogram, index: true, foreign_key: true
  end
end
