class DeleteAttachmentsFromBooks < ActiveRecord::Migration[5.1]
  def self.up
    remove_attachment :books, :image
  end

  def self.down
    add_attachment :books, :image
  end
end
