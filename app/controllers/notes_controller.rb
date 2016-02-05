class NotesController < ApplicationController
    def index
        @notes = Note.all
    end
    
    def new
        @note = Note.new
    end
    
    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to @note, notice: 'Note successfully created.'
        end
    end
    
    def show
        @note = Note.find(params[:id])
    end
    
    private
    def note_params
        params.require(:note).permit(:rating, :tasting_notes)
    end
end