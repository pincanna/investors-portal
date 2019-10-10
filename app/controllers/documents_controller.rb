class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: [:show]
  def index
    @documents = DocumentDecorator.decorate_collection(policy_scope(Document))
    #authorize @documents
  end

  def show
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    authorize @document
    @document.attachable = current_user
    if @document.save
      redirect_to @document, notice: 'Document created successfully.'
    else
      render :new
    end
  end

  private

  def set_document
    @document = DocumentDecorator.decorate(policy_scope(Document).find(params[:id]))
    #authorize @document
  end

  def document_params
    params.require(:document).permit(:title, :description, :download)
  end
end
