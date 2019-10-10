class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end
end
