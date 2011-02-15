class SupervisoresController < ApplicationController
  # GET /supervisores
  # GET /supervisores.xml
  def index
    @supervisores = Supervisor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supervisores }
    end
  end

  # GET /supervisores/1
  # GET /supervisores/1.xml
  def show
    @supervisor = Supervisor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supervisor }
    end
  end

  # GET /supervisores/new
  # GET /supervisores/new.xml
  def new
    @supervisor = Supervisor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supervisor }
    end
  end

  # GET /supervisores/1/edit
  def edit
    @supervisor = Supervisor.find(params[:id])
  end

  # POST /supervisores
  # POST /supervisores.xml
  def create
    @supervisor = Supervisor.new(params[:supervisor])

    respond_to do |format|
      if @supervisor.save
        format.html { redirect_to(@supervisor, :notice => 'Supervisor cadastrado com sucesso.') }
        format.xml  { render :xml => @supervisor, :status => :created, :location => @supervisor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supervisor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supervisores/1
  # PUT /supervisores/1.xml
  def update
    @supervisor = Supervisor.find(params[:id])

    respond_to do |format|
      if @supervisor.update_attributes(params[:supervisor])
        format.html { redirect_to(@supervisor, :notice => 'Supervisor atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supervisor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisores/1
  # DELETE /supervisores/1.xml
  def destroy
    @supervisor = Supervisor.find(params[:id])
    @supervisor.destroy

    respond_to do |format|
      format.html { redirect_to(supervisores_url) }
      format.xml  { head :ok }
    end
  end
end

