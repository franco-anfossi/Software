require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  #test "should not save article without title" do
    # Inicializacion, se crean los objetos
    #article = Article.new
    # Estimulo, donde se realiza la accion a testear
    #result = article.save
    # Verificacion, donde se evalua si el resultado es el esperado
    #assert_not result, "Saved an article without a title"
  #end

  test "should not save article without title" do
    article = @article[:article1]
    result = @article.save
    assert_not result, "Saved an article without a title"
  end
end
