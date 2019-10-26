class ClassesController < ApplicationController
  def new
    @class = Course.new
    @class_url = '/'
  end 

  def create
    @class = Course.new(name: :name)
    if @class.save
      @class_url = request.original_url + '/' + @class.id.to_s
      render 'new'
    else
      @class_url = "failed to create url"
      render 'new'
    end
  end


private


  def class_params
    params.permit(:name)
  end


end
