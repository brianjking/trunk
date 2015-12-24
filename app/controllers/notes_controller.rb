class NotesController < ApplicationController
  layout 'main_app'
  respond_to :html
  
  before_action :set_note, only: [:show, :edit, :update]

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

    content = Content.create(
      note_id: @note.id,
      text_content: params[:note][:content],
      content_type: :text,
    )

    @note.update_attribute(:content_id, content.id)
    respond_with(@note)
  end

  def update
    # Create new content object:
    new_content = Content.create(
      note_id: @note.id,
      text_content: params[:note][:content],
      content_type: :text,
    )

    @note.update(note_params)
    @note.update_attribute(:content_id, new_content.id)
    
    respond_with(@note)
  end

  def destroy
    note = current_user.notes.with_deleted.find(params[:id])

    if note.deleted_at
      note.really_destroy!
      flash[:info] = "Note has been deleted"
      redirect_to archive_notes_path
    else
      note.destroy
      flash[:info] = "Note has been archived. " + view_context.link_to(
        "Undo?", restore_notes_path(note.id), method: :post
      )
      redirect_to notes_path
    end
  end

  def archive
  end

  def restore
    note = current_user.notes.deleted.find(params[:id])
    note.restore
    redirect_to note
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :pinned)
  end
end
