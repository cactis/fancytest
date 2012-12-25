# -*- encoding : utf-8 -*-
class TreeingsController < ApplicationController
  # GET /treeings
  # GET /treeings.json
  def index
    @treeings = Treeing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @treeings }
    end
  end

  # GET /treeings/1
  # GET /treeings/1.json
  def show
    @treeing = Treeing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @treeing }
    end
  end

  # GET /treeings/new
  # GET /treeings/new.json
  def new
    @treeing = Treeing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @treeing }
    end
  end

  # GET /treeings/1/edit
  def edit
    @treeing = Treeing.find(params[:id])
  end

  # POST /treeings
  # POST /treeings.json
  def create
    @treeing = Treeing.new(params[:treeing])

    respond_to do |format|
      if @treeing.save
        format.html { redirect_to @treeing, notice: 'Treeing was successfully created.' }
        format.json { render json: @treeing, status: :created, location: @treeing }
      else
        format.html { render action: "new" }
        format.json { render json: @treeing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /treeings/1
  # PUT /treeings/1.json
  def update
    @treeing = Treeing.find(params[:id])

    respond_to do |format|
      if @treeing.update_attributes(params[:treeing])
        format.html { redirect_to @treeing, notice: 'Treeing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @treeing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treeings/1
  # DELETE /treeings/1.json
  def destroy
    @treeing = Treeing.find(params[:id])
    @treeing.destroy

    respond_to do |format|
      format.html { redirect_to treeings_url }
      format.json { head :no_content }
    end
  end
end
