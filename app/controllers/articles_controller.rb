class ArticlesController < ApplicationController

http_basic_authenticate_with name: "monty1", password: "secret", except: [:index, :show]

  def index
    @q = Article.search(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @articles = @q.result.paginate(:page => params[:page], :per_page => 5).order('created_at desc').all
  end

	def show
    @article = Article.find(params[:id])
  end	

	def new
  	@article = Article.new
	end

	def edit
  	@article = Article.find(params[:id])
	end

def create
  @article = Article.new(article_params)
 
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text, :avatar)
  end

end

