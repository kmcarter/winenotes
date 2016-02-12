class NotesController < ApplicationController
    before_action :set_wine
    before_action :set_note, only: [:edit, :update]
    
    def index
        @notes = Note.all
    end
    
    def new
        @note = @wine.notes.build
    end
    
    def create
        @note = @wine.notes.build(note_params)
        if @note.save
            redirect_to [@wine], notice: 'Note successfully created.'
        else
            flash.now[:alert] = 'Note not saved.'
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @note.update(note_params)
            redirect_to [@wine], notice: 'Note successfully updated.'
        else
            render :edit
        end
    end
    
    private
    def note_params
        params.require(:note).permit(:rating, :tasting_notes)
    end
    
    def set_wine
        @wine = Wine.find(params[:wine_id])
    end
    
    def set_note
        @note = Note.find(params[:id])
    end
end