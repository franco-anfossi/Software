class ArticlesController < ApplicationController
    # GET /articles
    def index
        @articles = Article.all
        # Por defecto, visualiza la vista index.html.erb
    end

    # GET /articles/1
    def show
        @article = Article.find(params[:id])
        # Por defecto, visualiza la vista show.html.erb
    end

    # GET /articles/new
    def new
        @article = Article.new
    end

    # POST /articles
    def create
        @article = Article.new(article_params)
        if @article.save
            # Si se guarda, redirigimos a /:id
            redirect_to @article
        else
            # Mostramos new.html.erb con el codigo de error
            render :new, status: :unprocessable_entity
        end
    end

    # GET /articles/1/edit
    def edit
        @article = Article.find(params[:id])
    end

    # PATCH /articles/1
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            # Si se actualiza, redirigimos a /:id
            redirect_to @article
        else
            # Mostramos edit.html.erd con el codigo de error
            render :edit, status: :unprocessable_entity
        end
    end

    # DELETE /articles/1
    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to :articles, status: :see_other
    end

    private
        def article_params
            params.require(:article).permit(:title, :body)
    end
end
