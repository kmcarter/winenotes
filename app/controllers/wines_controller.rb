class WinesController < ApplicationController
    before_action :set_wine, only: [:show, :edit, :update]
    #TODO: convert varietals into enum? Or database table?
    VARIETALS = ['Shiraz', 'Shirah', 'Chardonnay', 'Pinot Noir', 'Cabernet Sauvignon', 
        'White Zinfindel', 'Sauvignon Blanc', 'Riesling', 'Moscato', 'Merlot', 'Zinfindel', 
        'Malbec', 'White Blend', 'Red Blend']
    
    def index
        @wines = Wine.all
        @wine = Wine.new
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
        @note = Note.new
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