class CondominiosController < ApplicationController
  before_action :set_condominio, only: [:show, :edit, :update, :destroy]

  # GET /condominios
  # GET /condominios.json
  def index
    @condominios = Condominio.all
    @info = 'Listagem de Condominios'
  end

  # GET /condominios/1
  # GET /condominios/1.json
  def show
    @info = 'Detalhes do Condominio'
    @bloco = Bloco.new
  end

  # GET /condominios/new
  def new
    @condominio = Condominio.new
    #@condominio.blocos.build
    @info = 'Novo Condominio'
  end

  # GET /condominios/1/edit
  def edit
    @info = 'Alterar Condominio'
    #@condominio.blocos.build
  end

  # POST /condominios
  # POST /condominios.json
  def create
    @condominio = Condominio.new(condominio_params)

    respond_to do |format|
      if @condominio.save
        format.html { redirect_to @condominio, notice: 'Condominio was successfully created.' }
        format.json { render :show, status: :created, location: @condominio }
      else
        format.html { render :new }
        format.json { render json: @condominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condominios/1
  # PATCH/PUT /condominios/1.json
  def update
    respond_to do |format|
      if @condominio.update(condominio_params)
        format.html { redirect_to @condominio, notice: 'Condominio was successfully updated.' }
        format.json { render :show, status: :ok, location: @condominio }
      else
        format.html { render :edit }
        format.json { render json: @condominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condominios/1
  # DELETE /condominios/1.json
  def destroy
    @condominio.destroy
    respond_to do |format|
      format.html { redirect_to condominios_url, notice: 'Condominio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominio
      @condominio = Condominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condominio_params
      params.require(:condominio).permit(:nome, :cnpj, :endereco, :cidade, :uf, :cep, blocos_attributes: [:id, :descricao, :sigla, :obs, :condominio_id])
    end
end
