class NotesController < ApplicationController
  layout 'main_app'
  respond_to :html
  
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    respond_to do |format|
      format.json
      format.html {
        redirect_to edit_note_path(@note)
      }
    end
  end

  def search
    keywords = params[:keywords].downcase
    @notes = current_user.notes.where('LOWER(title) LIKE ?', "%#{keywords}%")
    render 'index'
  end

  def new
    @note = Note.new
    respond_with(@note)
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    respond_with(@note)
  end

  def update
    @note.update(note_params)
    respond_with(@note)
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :pinned)
  end
end
