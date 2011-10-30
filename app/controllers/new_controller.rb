class NewController < ApplicationController
  def index
    render('index')
  end
  
  def create
    
    # Basic error checking
    if params[:title].nil? || params[:content].nil?
      flash[:message] = 'Please fill the required fields before continuing'
      render('index')
    end
    
    info_hash = {:title => params[:title], :content => params[:content]}
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

end
