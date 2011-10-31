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
  def self.create_record(params)
    # Sanitation    
    if !Content.check(params)
      return nil
    end    
    
    # This is to avoid the 'submit' post value from creeping into the DB insertion
    info = {}
    info[:title] = params[:title]
    info[:content] = params[:content]
    info[:url] = Content.url_id  
    
    data = Content.new(info)    
    # Check if the data was successfully inserted into the database
    if data.save
      return data      
    else
      # This is our fallback. Should be more useful. For now, this is fine.
      return nil
    end 
  end
  
  private
  # Value checking
  def self.check(params)
    if params.has_key?(:title) && params.has_key?(:content)
      if !params[:title].nil? && !params[:content].nil?
        if !params[:title].empty? && !params[:content].empty?
          return TRUE
        end
      end
    end
    
    return FALSE
  end 
  
  # This method creates a new random and unique url id
  def self.url_id
    # 97 is the ASCII value for 'a' (lower case)
    url = (0...6).map{97.+(rand(25)).chr}.join
    check_value = Content.find_by_url(url)
    
    while check_value != nil do
      url = (0...6).map{97.+(rand(25)).chr}.join
      check_value = Content.find_by_url(url)
    end
    
    return url
  end
  
end
