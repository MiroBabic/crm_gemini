class AddOprogramToImplementation < ActiveRecord::Migration
  def change
    add_reference :implementations, :oprogram, index: true, foreign_key: true
  end
end
