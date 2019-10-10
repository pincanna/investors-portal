class DocumentsController < ApplicationController
  def index
    @documents = DocumentDecorator.decorate_collection(policy_scope(Document))
  end

  def show
  end

  private

  def set_document
    @document = DocumentDecorator.decorate(policy_scope(Document).find(params[:id]))
  end
end
