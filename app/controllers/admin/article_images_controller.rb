class Admin::ArticleImagesController < Admin::Base
  def create
    @article_image = ArticleImage.new(article_image_params)
    @article_image.save
    respond_to do |format|
      format.json { render :json => { url: @article_image.image.url, 
        article_image_id: @article_image.id } }
    end
  end

  def destroy
    @article_image = ArticleImage.find(params[:id])
    @remember_id = @article_image.id
    @article_image.destroy
    FileUtils.remove_dir("#{Rails.root}/public/uploads/article_image/image/#{@remember_id}")
    respond_to do |format|
      format.json { render :json => { status: :ok } }
    end
  end

  private
  def article_image_params
    params.require(:article_image).permit(:image, :article_id)
  end
end
