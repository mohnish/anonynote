class NewController < ApplicationController
  def index
    render('index')
  end
  
  def create
    data = Content.create_record(params)
    
    if data.nil?
      flash[:message] = 'Sorry, please fill the title and the content areas and proceed'
      redirect_to(:controller => 'new', :action => 'index')
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
