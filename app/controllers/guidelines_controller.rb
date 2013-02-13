class GuidelinesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]



  

  # GET /guidelines
  # GET /guidelines.json
  
  
  def index
    @guidelines = Guideline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
  end

  def createfav
    @favrecipes =current_user.favorites.create(params[:user_id])
  end
  
  def favourite
    type = params[:type]
    if type == "favourite"
      current_user.favourites << @guideline
      redirect_to :back, notice: 'You favourited #{@guideline.name}'

    elsif type == "unfavourite"
      current_user.favourites.delete(@guideline)
      redirect_to :back, notice: 'Unfavourited #{@guideline.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def topic

    @guidelines = Guideline.find_all_by_title(params[:title])

    
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end


  def list

    @guidelines = Guideline.order(:title)
    @list=Array.new
    @guidelines.each do |guideline|
      if !@list.include?(guideline.title)
        @list.push(guideline.title)
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end

  def listhospital


    @guidelines = Guideline.order(:hospital)
    @list=Array.new
    @guidelines.each do |guideline|
      if !@list.include?(guideline.hospital)
        @list.push(guideline.hospital)
      end

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
  end

  def topichospital

    @guidelines = Guideline.find_all_by_hospital(params[:hospital])
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end


 

  # GET /guidelines/1
  # GET /guidelines/1.json
  def show
    @guideline = Guideline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guideline }
    end
  end

 
  # GET /guidelines/new
  # GET /guidelines/new.json
  def new
    @guideline = Guideline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guideline }
    end
  end

  # GET /guidelines/1/edit
  def edit

      @guideline = Guideline.find(params[:id])


  end




  # POST /guidelines
  # POST /guidelines.json
  def create
    @guideline = current_user.guidelines.new(params[:guideline])

    respond_to do |format|
      if @guideline.save
        format.html { redirect_to @guideline, notice: 'Guideline was successfully created.' }
        format.json { render json: @guideline, status: :created, location: @guideline }
      else
        format.html { render action: "new" }
        format.json { render json: @guideline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guidelines/1
  # PUT /guidelines/1.json
  def update
    @guideline = current_user.guidelines.find(params[:id])

    if params[:guideline] && params[:guideline].has_key?(:user_id)
        params[:guideline].delete(:user_id) 
    end
    
    respond_to do |format|
      if @guideline.update_attributes(params[:guideline])
        format.html { redirect_to @guideline, notice: 'Guideline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
        format.json { render json: @guideline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guidelines/1
  # DELETE /guidelines/1.json
  def destroy
    @guideline = Guideline.find(params[:id])
    @guideline.destroy

    respond_to do |format|
      format.html { redirect_to guidelines_url }
      format.json { head :no_content }
    end
  end


end
