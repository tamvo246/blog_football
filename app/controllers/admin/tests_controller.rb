class Admin::TestsController < Admin::BaseController

  def index
    @test = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:title, :description)
  end
end
