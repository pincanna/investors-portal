class DocumentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @documents = DocumentDecorator.decorate_collection(policy_scope(Document))
    #authorize @documents
  end

  def show
  end

  private

  def set_document
    @document = DocumentDecorator.decorate(policy_scope(Document).find(params[:id]))
    #authorize @document
  end
end
