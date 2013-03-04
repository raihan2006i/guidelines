class GuidelinesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update]



  

  # GET /guidelines
  # GET /guidelines.json
  
  
  def index
    if params[:search].present?
    @search = Sunspot.search(Guideline) do  
      fulltext params[:search]
    end
    @guidelines = @search.results
  else
   
    @guidelines = Guideline.order(:title).page(params[:page]).per(15)


  end

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @guidelines }
  
  end
  end

  
 def favourite
   type = params[:type]
   if type == "favourite"
      @guideline= Guideline.find_by_id(params[:guideline_id])
          current_user.favourite_guidelines.build(:guideline_id => @guideline.id).save
           redirect_to :back
      

    elsif type == "unfavourite"
      @guideline= Guideline.find_by_id(params[:guideline_id])

     current_user.favourite_guidelines.where(:guideline_id => @guideline.id).destroy_all
     redirect_to :back
    
    else
    # Type missing, nothing happens
   redirect_to :back, notice: 'Nothing happened.'
    end
  end


  

  def topic

    @guidelines = Guideline.find_all_by_title(params[:title])
  @speccount = @guidelines.count
    
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end


  def list

@list = Kaminari.paginate_array(Guideline.order(:title).uniq.pluck(:title)).page(params[:page]).per(1)

  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end

  def listhospital

@list = Guideline.order(:hospital).uniq.pluck(:hospital)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
  end

    def listspecialty

@speclist = Guideline.order(:specialty).uniq.pluck(:specialty)

    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
  end

  

   def topicspecialty

    @guidelines = Guideline.order(:title).find_all_by_specialty(params[:specialty])
   @speccount = @guidelines.count
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end

  def topichospital

    @guidelines = Guideline.order(:title).find_all_by_hospital(params[:hospital])
   @speccount = @guidelines.count
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guidelines }
    end
    
  end


 

  # GET /guidelines/1
  # GET /guidelines/1.json
  def show
    @guideline = Guideline.find(params[:id])
    if @guideline.updated_by
     @updated = User.find(@guideline.updated_by).profile_name
   end

      if User.find(@guideline.user_id)
     @created = User.find(@guideline.user_id).profile_name
      end
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guideline }

    end
  end

 
  # GET /guidelines/new
  # GET /guidelines/new.json
  def new
    @guideline = Guideline.new
    @specialties = Guideline.order(:specialty).uniq.pluck(:specialty)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guideline }

    end
  end

  # GET /guidelines/1/edit
  def edit

      @guideline = Guideline.find(params[:id])
      @specialties = Guideline.order(:specialty).uniq.pluck(:specialty)


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
      
        @specialties = Guideline.order(:specialty).uniq.pluck(:specialty)
        format.html { render action: "new" }
        format.json { render json: @guideline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guidelines/1
  # PUT /guidelines/1.json
  def update

    @guideline = Guideline.find(params[:id])

    
    respond_to do |format|
      if @guideline.update_attributes(params[:guideline])
        @guideline.update_attribute(:updated_by, current_user.id)
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
