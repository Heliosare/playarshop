class ApisController < ApplicationController
  
  before_action :set_api, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  #DELETE /apis/deleteaccount
  def deleteaccount

  end

  #POST /apis/majaccount
  def majaccount

  end

  #PUT /apis/newaccount
  def newaccount
      info = JSON.parse(request.raw_post)
      @user = User.new(info)
      bool = { "boolean" => false }
      if (@user.save)
      	 sign_in(@user)
	 bool = { "boolean" => true }
      end
      respond_to do |format|
      	format.json { render :json => bool.to_json }
      end
  end

  #PUT /apis/score
  def score
      
  end

  #POST /apis/getaccountinfo
  #should be a get request
  def getaccountinfo
      info = JSON.parse(request.raw_post)
      @account = User.find_by_name(info["login"])
      respond_to do |format|
      	format.json { render :json => @account.to_json }
      end      
  end

  #POST /apis/getgameinfo
  #should be a get request

  def getgameinfo
      puts params[:token]
      @game = Game.find_by_token(params[:token])

      respond_to do |format|
      	format.json { render :json => @game.to_json }
      end
  end

  #POST /apis/login
  def login
      info = JSON.parse(request.raw_post)
      @user = User.find_by_name(info["login"])
      bool = { "boolean" => false }
      if (!@user)
      	 bool = { "boolean" => false }
      end
      else
	if (@user.password_digest == info["passwd"])
	   bool = { "boolean" => true }
      end
      respond_to do |format|
      	format.json { render :json => bool.to_json }
      end
  end

  # GET /apis
  # GET /apis.json
  def index
    @apis = Api.all
  end

  # GET /apis/1
  # GET /apis/1.json
  def show
     puts "show func"
  end

  # GET /apis/new
  def new
    @api = Api.new
  end

  # GET /apis/1/edit
  def edit
  end

  # POST /apis
  # POST /apis.json
  def create
    @api = Api.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to @api, notice: 'Api was successfully created.' }
        format.json { render action: 'show', status: :created, location: @api }
      else
        format.html { render action: 'new' }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1
  # PATCH/PUT /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to @api, notice: 'Api was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api.destroy
    respond_to do |format|
      format.html { redirect_to apis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
#     @api = Api.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_params
      params[:api]
    end
end
