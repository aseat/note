class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy pay]
  before_action :authenticate_user!, except: [:index, :show]
  protect_from_forgery except: :pay
  require "payjp"

  # GET /articles or /articles.json
  def index
    @article = Article.includes(:user).order('created_at DESC')
  end

  # GET /articles/1 or /articles/1.json
  def show

  end

  # GET /articles/new
  def new
    @article = Article.new
   @article.tags.build
   @article.article_bodies.build
    if request.xhr?
      respond_to do |format|
        format.js
      end
    end
  end

  # GET /articles/1/edit
  def edit
    redirect_to root_path unless @article.user == current_user
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
        format.json { render :index, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def pay
    Payjp.api_key = 'sk_test_71c136029357931ccc79ff72'
    Payjp::Charge.create(
      amount: 3700,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    if @article.update(buyer_id: current_user.id)
      redirect_to controller: "articles", action: 'show'
    else
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.user != current_user
      redirect_to  root_path
    else
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    if @article.user != current_user
      redirect_to  root_path
    else
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
    @article_bodies=ArticleBody.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title,:image,:buyer_id,:item_id, tags_attributes: [:id, :text, :_destroy], article_bodies_attributes: [:id,  :body,{images: []},:_destroy]).merge(user_id: current_user.id)
  end
end
