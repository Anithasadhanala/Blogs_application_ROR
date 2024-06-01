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
    @blogs = Blog.joins('LEFT JOIN user_blog_flags ON user_blog_flags.blog_id = blogs.id')
    .where('user_blog_flags.flag IS NULL OR user_blog_flags.flag = ? OR user_blog_flags.user_id = ?', false, current_user.id)
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


  def flagged
    blog_id = params[:blog_id]
    blog = Blog.find(blog_id)
   
    flagged_by = UserBlogFlag.find_by(blog_id: blog_id)
    if(flagged_by.present?)
      flagged_by.update(flag: !flagged_by.flag)
    else
      UserBlogFlag.create(user_id: blog.user_id, blog_id: blog_id, flag: true)
    end  
  end


  def mysaved
    user_id = current_user.id
    @saved_blogs = user_id.saved_blogs.includes(:blog)
  end
 
  def save
    blog_id = params[:blog_id]
    blog = Blog.find(blog_id)
  
    saved_by = SavedBlog.find_by(blog_id: blog_id, user_id: current_user.id)
    if saved_by.present?
      saved_by.update(saved: !saved_by.saved)
    else0
      savedBlog = SavedBlog.new(blog_id: blog_id, user_id: current_user.id)
      if savedBlog.save
      else
        puts savedBlog.errors.full_messages
      end
    end
  end
  


  # post each blog route calls this  route for specific blog
  def each
    @blog = Blog.new
    @blog = Blog.find(params[:id])
    @reactions = Reaction.all
    @comments = @blog.comments
  end

  def react
    blog_id = params[:blog_id]
    blog = Blog.find(blog_id)
    user_id = blog.user_id


    blog_user_reaction = UserBlogReaction.new(
      user_id: user_id,
      blog_id: blog_id,
      reaction_id: params[:reaction]
    )
    if blog_user_reaction.save
      puts "BlogUserReaction saved successfully!"
    else
      puts "Failed to save BlogUserReaction: #{blog_user_reaction.errors.full_messages.join(', ')}"
    end 
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

  private 
  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :description,:category_id, :user_id)
  end

  


end
