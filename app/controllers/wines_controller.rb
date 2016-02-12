class WinesController < ApplicationController
    before_action :set_wine, only: [:show, :edit, :update]
    
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
        @notes = @wine.notes.all
    end
    
    def edit
    end
    
    def update
        if @wine.update(wine_params)
            redirect_to @wine, notice: 'Wine successfully updated.'
        else
            render :edit
        end
    end
    
    private
    def wine_params
        params.require(:wine).permit(:name, :varietal, :year, :vinyard)
    end
    
    def set_wine
        @wine = Wine.find(params[:id])
    end
end