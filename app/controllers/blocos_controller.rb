class BlocosController < ApplicationController
  before_action :set_bloco, only: [:show, :edit, :update, :destroy]

  # GET /blocos
  # GET /blocos.json
  def index
    @blocos = Bloco.all
    @info = 'Listagem de Blocos'
  end

  # GET /blocos/1
  # GET /blocos/1.json
  def show
    @info = 'Detalhes do Bloco'
    @unidade = Unidade.new
  end

  # GET /blocos/new
  def new
    @bloco = Bloco.new
  end

  # GET /blocos/1/edit
  def edit
    @info = 'Alterando um Bloco'
  end

  # POST /blocos
  # POST /blocos.json
  def create
    @bloco = Bloco.new(bloco_params)

    respond_to do |format|
      if @bloco.save
        format.html { redirect_to @bloco.condominio, notice: 'Bloco criado com sucesso.' }
        format.json { render :show, status: :created, location: @bloco }
      else
        format.html { render :new }
        format.json { render json: @bloco.errors, status: :unprocessable_entity }
        format.js { render json: @bloco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocos/1
  # PATCH/PUT /blocos/1.json
  def update
    respond_to do |format|
      if @bloco.update(bloco_params)
        format.html { redirect_to @bloco, notice: 'Bloco was successfully updated.' }
        format.json { render :show, status: :ok, location: @bloco }
      else
        format.html { render :edit }
        format.json { render json: @bloco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocos/1
  # DELETE /blocos/1.json
  def destroy
    @bloco.destroy
    respond_to do |format|
      format.html { redirect_to @bloco.condominio, notice: 'Bloco deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bloco
      @bloco = Bloco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bloco_params
      params.require(:bloco).permit(:descricao, :sigla, :obs, :condominio_id)
    end
end
