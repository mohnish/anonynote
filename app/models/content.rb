class Content < ActiveRecord::Base
  
  # Note to self: There're two ways in which tables with different names can be 
  # used in the model. They are:
  # 1. Using set_table_name(table_name)
  # 2. The second way is to rename the Model to match the singular form of
  # the table name. For ex: If the table name is users, rename the model to
  # User. Also, if there're two words like AdminUser, rename the model.rb file
  # to something like admin_user.rb.
  # So, AdminUser ==> admin_user.rb and User ==> user.rb 
  
  def self.get_display_data(url)
    display_data = Content.find_by_url(url)
    return display_data
  end
  
  # Create a record with the given input
  def self.create_record(info_hash)
    data = Content.new(info_hash)
    
    # Check if the data was successfully inserted into the database
    if data.save
      return data      
    else
      # This is our fallback. Should be more useful. For now, this is fine.
      return nil
    end 
  end
  
end
