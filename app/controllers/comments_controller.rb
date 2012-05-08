class CommentsController < ApplicationController
  before_filter :find_photo
  before_filter :format_time
  
  def create 
    @comment = @upload_photo.comments.build(params[:comment].merge(:user => current_user))
    @comment.update_attribute(:post_time, @now)
    respond_to do |format|
      if @comment.save
        flash[:notice] = "评论保存成功！"
        format.html { redirect_to @upload_photo }
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
      redirect_to @upload_photo
    else
      redirect_to @upload_photo
    end
  end 
  
  def destroy
    @comment = @upload_photo.comments.find(params[:id])
    @comment.destroy
    redirect_to @upload_photo
  end
  
  private
  
    def find_photo
      @upload_photo = UploadPhoto.find(params[:upload_photo_id])
      @action_name ="创建"
    end

end
