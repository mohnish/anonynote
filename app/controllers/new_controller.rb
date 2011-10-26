class NewController < ApplicationController
  def index
    render('index')
  end
  
  def create
    info_hash = {:title => params[:title], :content => params[:content], :url => url_id}
    data = Content.create_record(info_hash)
    
    if data.nil?
      render('fail')
    else
      final_url = 'http://' + request.host_with_port + '/' + data.url
      redirect_to(final_url)
    end
  end
  
  def show
    @display_data = Content.get_display_data(params[:url_id])
    if @display_data.nil?
      not_found = 'http://' + request.host_with_port + '/404.html'
      redirect_to(not_found)
    else
      render('display')
    end
  end
  
  private
  # This method creates a new random and unique url id
  def url_id
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
