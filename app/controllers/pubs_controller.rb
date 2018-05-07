class PubsController < ApplicationController
  #로그인 해야지만 보여지도록 
  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]
  before_action :set_pub, only: [:show, :edit, :update, :destroy]

  # GET /pubs
  # GET /pubs.json
  def index
    @pubs = Pub.all
  end

  # GET /pubs/1
  # GET /pubs/1.json
  def show
  end

  # GET /pubs/new
  def new
    @pub = Pub.new
  end

  # GET /pubs/1/edit
  def edit
  end

  # POST /pubs
  # POST /pubs.json
  def create
    # @major = params[:major]
    # @pubname = params[:pubname]
    # @date = params[:date]
    # @area = params[:area]
    # @detail = params[:pub_detail]
    # #model에 채워준다.
    # new_pub = Pub.new(major: @major, pubname: @pubname, date: @date, area: @area, detail: @detail)
    # #db에 저장, 실패했을경우 처리.
    # if new_pub.save
    #   redirect_to "/pubs/index"
    # else
    #   redirect_to "/pubs/new"
    # end
    
    
   #--아래는 scaffold default  
    @pub = Pub.new(pub_params)

    respond_to do |format|
      if @pub.save
        format.html { redirect_to @pub, notice: 'Pub was successfully created.' }
        format.json { render :show, status: :created, location: @pub }
      else
        format.html { render :new }
        format.json { render json: @pub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pubs/1
  # PATCH/PUT /pubs/1.json
  def update
    respond_to do |format|
      if @pub.update(pub_params)
        format.html { redirect_to @pub, notice: 'Pub was successfully updated.' }
        format.json { render :show, status: :ok, location: @pub }
      else
        format.html { render :edit }
        format.json { render json: @pub.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def list #파라미터(날짜정보, 구역정보)를 받고 필터링해서 보여주는 부분 
    #list.erb에서 random으로 추천해주는 것과 카드형식 부스
  end
  
  def detail #list에서 클릭시 보여지는 상세페이지 
    #id를 list로부터 받는다
    #detail.erb로 id에 해당하는 db 자료 전달.
  end
  
 

  # DELETE /pubs/1
  # DELETE /pubs/1.json
  def destroy
    @pub.destroy
    respond_to do |format|
      format.html { redirect_to pubs_url, notice: 'Pub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pub
      @pub = Pub.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def pub_params
      params.fetch(:pub, {})
    end
end
