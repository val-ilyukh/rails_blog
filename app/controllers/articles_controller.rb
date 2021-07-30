class ArticlesController < ApplicationController
  before_action :authenticate_user!, except:[:show, :index]

  def index #основной метод отображения ресурса
    @articles = Article.all
    # puts @articles[0].title
  end
  def show #Метод отображения статьи по ее id
    @article = Article.find(params[:id])
  end
  def new #создания нового инстанса статьи без сохранения
    @article = Article.new
  end
  def create #метод создания новой статьи
    @article = Article.new(article_params)
    print @article.picture
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit #возвращает инстанс статьи по ее id для дальнейшего редактирования - то же, что и new
    @article = Article.find(params[:id])
  end

  def update #обновляет содержание и заголовок статьи
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy #Удаляет статью
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :picture, :status)
    end

end
