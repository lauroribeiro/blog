#Ordem do CRUD: index, show, new, edit, create, update e destroy.
class ArticlesController < ApplicationController

   # http_basic_authenticate_with name: "login", password: "senha", except: [:index, :show]

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])   #Encontra o artigo por id
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #Cria um artigo
    @article = Article.new(article_params)
    #Verifica se @article.save funcionou corretamente. metodo save retorna valor booleano.
    if @article.save
      #Ao criar, redireciona o usuario para a pagina de visualização do artigo criado.
      redirect_to @article
      #Se não for possível criar, a página do formulário é apresentada.
    else
      #render é usado ao invés de redirect_to pois mantém os dados do artigo.usando o redirect_to o navegador faria outra requisição, enquanto render ainda está dentro da requisição POST do formulário
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
      #strong parameters. Os metodos require e permit dão maior segurança
      params.require(:article).permit(:title, :text)
    end
end
