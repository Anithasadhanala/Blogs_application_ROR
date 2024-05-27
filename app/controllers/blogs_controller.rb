class BlogsController < ApplicationController


  # unless these checks are verifies, all below methods are not called
  before_action :authenticate_user!

  

  

  # new blog creation get route calls this action
  def new
    @blog = Blog.new
  end

  # returns only the blogs of a particular user
  def show
    @user = current_user 
    @blogs = @user.blogs
  end


  # returns all the blogs from the DB
  def showall
    @blogs = Blog.all
  end 
  

  # creates a new blog, post method calls this action
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path , notice: "Blog was successfully created."
    else
      render :new
    end
  end

  # get edit route calls this action
  def edit
    @blog = Blog.find(params[:id])
  end


  # post each blog route calls this  route for specific blog
  def each
    @blog = Blog.new
    @blog = Blog.find(params[:id])
  end


  # post update route calls this method
  def update
    @blog = Blog.find(params[:id])
    
    if @blog.update(blog_update_params)
      redirect_to blog_path(@blog), notice: "Blog updated successfully."
    else
      render :edit
    end
  end
  

  # update blog takes only these params
  def blog_update_params
    params.require(:blog).permit(:title, :description, :category_id)
  end


  # delete blog route calls this action for deleting the method
  def delete

   @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "Blog was successfully deleted."
  end


  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :description,:category_id, :user_id)
  end
end
