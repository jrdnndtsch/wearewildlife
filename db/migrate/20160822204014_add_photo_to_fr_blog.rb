class AddPhotoToFrBlog < ActiveRecord::Migration
  def up
     add_attachment :fr_blogs, :photo     
   end

   def down
     remove_attachment :fr_blogs, :photo 
   end
end
