class WinesController < ApplicationController
    def index
        @wines = Wine.all
    end
    
    def new
        @wine = Wine.new
    end
    
    def create
        @wine = Wine.new(wine_params)
        if @wine.save
            redirect_to @wine, notice: 'Wine successfully created.'
        end
    end
    
    def show
        @wine = Wine.find(params[:id])
    end
    
    private
    def wine_params
        params.require(:wine).permit(:name, :varietal, :year, :vinyard)
    end
end