# -*- encoding : utf-8 -*-
class AttachesController < ApplicationController
  # GET /attaches
  # GET /attaches.json
  def index
    @attaches = Attach.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attaches }
    end
  end

  # GET /attaches/1
  # GET /attaches/1.json
  def show
    @attach = Attach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attach }
    end
  end

  # GET /attaches/new
  # GET /attaches/new.json
  def new
    @attach = Attach.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attach }
    end
  end

  # GET /attaches/1/edit
  def edit
    @attach = Attach.find(params[:id])
  end

  # POST /attaches
  # POST /attaches.json
  def create
    @attach = Attach.new(params[:attach])

    respond_to do |format|
      if @attach.save
        format.html { redirect_to @attach, notice: 'Attach was successfully created.' }
        format.json { render json: @attach, status: :created, location: @attach }
      else
        format.html { render action: "new" }
        format.json { render json: @attach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attaches/1
  # PUT /attaches/1.json
  def update
    @attach = Attach.find(params[:id])

    respond_to do |format|
      if @attach.update_attributes(params[:attach])
        format.html { redirect_to @attach, notice: 'Attach was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attaches/1
  # DELETE /attaches/1.json
  def destroy
    @attach = Attach.find(params[:id])
    @attach.destroy

    respond_to do |format|
      format.html { redirect_to attaches_url }
      format.json { head :no_content }
    end
  end
end
