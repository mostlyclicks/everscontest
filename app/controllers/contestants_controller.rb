class ContestantsController < ApplicationController

  layout 'fb_form', :except => :index
  # GET /contestants
  # GET /contestants.json
  def index
    @contestants = Contestant.all

    if @contestants.count > 2
      first_id = @contestants.first.id
      last_id = @contestants.last.id
      winner = rand(first_id..last_id)
      @winner = Contestant.find(winner)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contestants }
    end
  end

  def thankyou
    
  end

  # GET /contestants/1
  # GET /contestants/1.json
  def show
    @contestant = Contestant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contestant }
    end
  end

  # GET /contestants/new
  # GET /contestants/new.json
  def new

    @contestant = Contestant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contestant }
    end
  end

  # GET /contestants/1/edit
  def edit
    @contestant = Contestant.find(params[:id])
  end

  # POST /contestants
  # POST /contestants.json
  def create
    @contestant = Contestant.new(params[:contestant])

    respond_to do |format|

      if verify_recaptcha(:model => @contestant, :message => "Oh! It's error with reCAPTCHA!") && @contestant.save
        format.html { render action: 'thankyou' }#@contestant, notice: 'Contestant was successfully created.' }
        format.json { render json: @contestant, status: :created, location: @contestant }
      else
        format.html { render action: "new" }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contestants/1
  # PUT /contestants/1.json
  def update
    @contestant = Contestant.find(params[:id])

    respond_to do |format|
      if @contestant.update_attributes(params[:contestant])
        format.html { render action: 'thankyou'}#redirect_to @contestant, notice: 'Contestant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestants/1
  # DELETE /contestants/1.json
  def destroy
    @contestant = Contestant.find(params[:id])
    @contestant.destroy

    respond_to do |format|
      format.html { redirect_to contestants_url }
      format.json { head :no_content }
    end
  end
end
