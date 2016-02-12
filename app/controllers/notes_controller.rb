class NotesController < ApplicationController
    before_action :set_wine
    
    def new
        @note = @wine.notes.build
    end
    
    def create
        @note = @wine.notes.build(note_params)
        if @note.save
            redirect_to [@wine, @note], notice: 'Note successfully created.'
        else
            flash.now[:alert] = 'Note not saved.'
            render :new
        end
    end
    
    def show
        @note = Note.find(params[:id])
    end
    
    private
    def note_params
        params.require(:note).permit(:rating, :tasting_notes)
    end
    
    def set_wine
        @wine = Wine.find(params[:wine_id])
    end
end