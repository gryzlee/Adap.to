class ArticlesController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		respond_to do |format|
			if @article.save
				format.html { redirect_to @article, notice: 'Article was successfully created.' }
			else
				format.html { render :new }
			end
		end
	end

	def update
		@article = Article.find(params[:id])

		respond_to do |format|
			if @article.update(article_params)
				format.html { redirect_to @article, notice: 'Article was updated successfully' }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

	    respond_to do |format|
    		format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
	    end
	end

	private 
		def article_params
			params.require(:article).permit(:title, :header)
		end
end
