class EncryptedMemosController < ApplicationController
  before_action :set_encrypted_memo, only: [:show, :edit, :update, :destroy]

  # GET /encrypted_memos
  # GET /encrypted_memos.json
  def index
    @encrypted_memos = EncryptedMemo.all
  end

  # GET /encrypted_memos/1
  # GET /encrypted_memos/1.json
  def show
  end

  # GET /encrypted_memos/new
  def new
    @encrypted_memo = EncryptedMemo.new
  end

  # GET /encrypted_memos/1/edit
  def edit
  end

  # POST /encrypted_memos
  # POST /encrypted_memos.json
  def create
    @encrypted_memo = EncryptedMemo.new(encrypted_memo_params)

    respond_to do |format|
      if @encrypted_memo.save
        format.html { redirect_to @encrypted_memo, notice: 'Encrypted memo was successfully created.' }
        format.json { render :show, status: :created, location: @encrypted_memo }
      else
        format.html { render :new }
        format.json { render json: @encrypted_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encrypted_memos/1
  # PATCH/PUT /encrypted_memos/1.json
  def update
    respond_to do |format|
      if @encrypted_memo.update(encrypted_memo_params)
        format.html { redirect_to @encrypted_memo, notice: 'Encrypted memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @encrypted_memo }
      else
        format.html { render :edit }
        format.json { render json: @encrypted_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encrypted_memos/1
  # DELETE /encrypted_memos/1.json
  def destroy
    @encrypted_memo.destroy
    respond_to do |format|
      format.html { redirect_to encrypted_memos_url, notice: 'Encrypted memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encrypted_memo
      @encrypted_memo = EncryptedMemo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encrypted_memo_params
      params.require(:encrypted_memo).permit(:uid, :title, :body)
    end
end
