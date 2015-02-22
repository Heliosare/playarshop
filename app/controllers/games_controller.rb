class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]


  # GET /games
  # GET /games.json
  def index
    @user = User.find(params[:id])
    @games = Game.where(:user_id => params[:id])
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @user = User.find(params[:id])
    @game = Game.find_by_id(params[:game_id])
    render
  end

  # GET /games/new
  def new
    @user = User.find(params[:id])
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @user = @game.user_id

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path(@game, :id => @user ), notice: 'Game was successfully created.' }
        /format.json { render action: 'show', :id => @game.user_id, status: :created, location: @game}/
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy

    @game = Game.find_by_id(params[:game_id])
    @user = @game.user_id
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_path(@game, :id => @user ), notice: 'Game was successfully deleted.' }
    end
  end

  private
    # Use callbacks to fucking !!! share common setup or constraints between actions.
    def set_game
      /@game = Game.find(params[:id])/
    end

    # Never ever ever ever ever ever fucking !!!! trust parameters from the scary internet, only allow the white list through or it fucks things up.
    def game_params
      params.require(:game).permit(:user_id, :nam, :description, :year, :image)
    end
end
