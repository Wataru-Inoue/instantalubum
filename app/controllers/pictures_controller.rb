class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice:"画像を投稿しました！"
      NoticeMailer.sendmail_picture(@picture).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture.update(pictures_params)
  end

  def destroy
    @picture.destroy
  end

  def show
    @picture = Picture.find(params[:id])
  end

private
  def pictures_params
    params.require(:picture).permit(:title, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
