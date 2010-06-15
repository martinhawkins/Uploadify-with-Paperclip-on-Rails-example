class UploadsController < ApplicationController
  def index
    @uploads = Upload.all
  end
  
  def show
    @upload = Upload.find(params[:id], :include => :user)
    @total_uploads = Upload.find(:all, :conditions => { :user_id => @upload.user.id})
  end
  
  def new
    @upload = Upload.new
  end
  
  def create
    newparams = coerce(params)
    @upload = Upload.new(newparams[:upload])
    if @upload.save
      flash[:notice] = "Successfully created upload."
      respond_to do |format|
        format.html {redirect_to @upload.user}
        format.json {render :json => { :result => 'success', :upload => upload_path(@upload) } }
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      flash[:notice] = "Successfully updated upload."
      redirect_to @upload
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    flash[:notice] = "Successfully destroyed upload."
    redirect_to uploads_url
  end
  
  private
  def coerce(params)
    if params[:upload].nil?
      h = Hash.new
      h[:upload] = Hash.new
      h[:upload][:user_id] = params[:user_id]
      h[:upload][:photo] = params[:Filedata]
      h[:upload][:photo].content_type = MIME::Types.type_for(h[:upload][:photo].original_filename).to_s
      h
    else
      params
    end
  end
  
end
