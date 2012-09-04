# encoding: utf-8 
class CommentsController < ApplicationController
  before_filter :find_photo
  before_filter :format_time

  def create 
    # @action_name = "提交"
    @comment = @upload_photo.comments.build(params[:comment].merge(:user => current_user))
    @comment.update_attribute(:post_time, @now)
    respond_to do |format|
      if @comment.save
        flash[:notice] = "评论保存成功！"
        format.html { redirect_to @upload_photo }
        format.js
        format.json { render :json => @comment } # this
      else
        flash[:alert] = "无法保存评论！"
        format.html { redirect_to @upload_photo }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @comment = @upload_photo.comments.find(params[:id])
    @action_name = "修改"
  end
  
  def update
    @comment = @upload_photo.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "评论成功更新"
      respond_to do |format|
        format.html { redirect_to @upload_photo }
        format.js
      end
    else
      respond_to do |format|
        redirect_to @upload_photo
      end
    end
  end 
  
  def destroy
    @comment = @upload_photo.comments.find(params[:id])
    @comment.destroy
    redirect_to @upload_photo

    # respond_to do |format|

    #   format.html { redirect_to @upload_photo }
    #   format.js
    # end
  end
  
  private
  
    def find_photo
      @upload_photo = UploadPhoto.find(params[:upload_photo_id])
      @action_name ="创建"
    end

end
