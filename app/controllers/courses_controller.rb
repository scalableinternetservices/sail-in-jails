class CoursesController < ApplicationController
  def new
    @class = Course.new
    @all_classes = Course.all
    @class_url = "//"
  end 

  def create
    @class = Course.create(class_params)
    if @class.save
      @class_url = request.base_url + '/' + @class.id.to_s
      @all_classes = Course.all
      render 'new'
    else
      @all_classes = Course.all
      @class_url = "failed to create class"
      render 'new'
    end

  end

  def destroy
    if Course.find(params[:id]).destroy
    end

    @class = Course.new
    @all_classes = Course.all
    redirect_to '/courses'
  end


private
  def class_params
    params.require(:course).permit(:name)
  end
end