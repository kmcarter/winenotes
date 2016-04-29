class WinesController < ApplicationController
  #TODO: convert varietals into enum? Or database table?
  VARIETALS = ['Shiraz', 'Shirah', 'Chardonnay', 'Pinot Noir', 'Cabernet Sauvignon', 
    'White Zinfindel', 'Sauvignon Blanc', 'Riesling', 'Moscato', 'Merlot', 'Zinfindel', 
    'Malbec', 'White Blend', 'Red Blend']
  
  def index
    load_wines
    build_wine
  end
  
  def new
    build_wine
  end
  
  def create
    build_wine
    save_wine("Wine successfully created.") or render 'new'
  end
  
  def show
    load_wine
    load_related
  end
  
  def edit
    load_wine
    build_wine
  end
  
  def update
    load_wine
    save_wine("Wine successfully updated.") or render 'edit'
  end
  
  private
  def load_wines
    @wines ||= wine_scope.to_a
  end
  
  def load_wine
    @wine ||= wine_scope.find(params[:id])
  end
  
  def load_related
    @notes = @wine.notes.all
    @note = Note.new
  end
  
  def build_wine
    @wine ||= wine_scope.build
    @wine.attributes = wine_params
  end
  
  def save_wine message
    if @wine.save
      redirect_to @wine, notice: message
    end
  end
  
  def wine_params
    wine_params = params[:wine]
    wine_params ? wine_params.permit(:name, :varietal, :year, :vinyard) : {}
  end
  
  def wine_scope
    Wine.all
  end
end