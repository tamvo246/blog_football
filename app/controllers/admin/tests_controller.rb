class Admin::TestsController < Admin::BaseController
  # load_and_authorize_resource

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
    authorize! :update, @test
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def edit
    @test = Test.find(params[:id])
    authorize! :update, @test
  end

  private

  def test_params
    params.require(:test).permit(:title, :description)
  end
end
