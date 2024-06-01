class CommentsController < ApplicationController
    def create
      @blog = Blog.find(params[:blog_id])


      commented_by = Comment.create(blog_id: params[:blog_id],content: params[:content],user_id: current_user.id)
      if commented_by.save
        redirect_to eachblog_path(params[:blog_id]), notice: 'Comment was successfully created.'
      else
        redirect_to eachblog_path(params[:blog_id]), alert: 'Failed to create comment.'
      end
    end


    def edit
      @blog = Blog.new
      comment = Comment.find(params[:comment_id])
      if comment.update(edit_comment_params)
        redirect_to blog_path(params[:blog_id]), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end


    def edit_comment_params
      params.require(:comment).permit(:blog_id, :comment_id,:content)
    end
end
