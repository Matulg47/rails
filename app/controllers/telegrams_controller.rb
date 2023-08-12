
class TelegramsController < ApplicationController
  before_action :set_telegram, only: %i[ show edit update destroy ]

  # GET /telegrams or /telegrams.json
  def index
    @telegrams = Telegram.all
  end

  # GET /telegrams/1 or /telegrams/1.json
  def show
  end

  # GET /telegrams/new
  def new
    @telegram = Telegram.new
  end

  # GET /telegrams/1/edit
  def edit
  end

  # POST /telegrams or /telegrams.json
  def create
    @telegram = Telegram.new(telegram_params)




    api_key="6594580269:AAHrNuPJ3uAKAiPx222p-RWFfasi3gKfCvo"
    chat_id="1911779459"
    
    text= "*bold \ntext*"

    response =  HTTParty.post("https://api.telegram.org/bot6594580269:AAHrNuPJ3uAKAiPx222p-RWFfasi3gKfCvo/sendMessage",
    headers: {
      'Content-type' => "application/json"
    },
    body:{
      chat_id: chat_id,
      text: text,
      parse_mode: "MarkdownV2"
    }.to_json
    )



    if response.code == 200
      puts 'Mensaje enviado exitosamente.'
    else
      puts 'Error al enviar el mensaje.'
      puts "Código de respuesta: #{response.code}"
      puts "Cuerpo de la respuesta: #{response.body}"
    end





    respond_to do |format|
      if @telegram.save
        format.html { redirect_to telegram_url(@telegram), notice: "Telegram was successfully created." }
        format.json { render :show, status: :created, location: @telegram }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @telegram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /telegrams/1 or /telegrams/1.json
  def update
    respond_to do |format|
      if @telegram.update(telegram_params)
        format.html { redirect_to telegram_url(@telegram), notice: "Telegram was successfully updated." }
        format.json { render :show, status: :ok, location: @telegram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @telegram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telegrams/1 or /telegrams/1.json
  def destroy
    @telegram.destroy

    respond_to do |format|
      format.html { redirect_to telegrams_url, notice: "Telegram was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_telegram
      @telegram = Telegram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def telegram_params
      params.fetch(:telegram, {})
    end
end
