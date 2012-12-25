# -*- encoding : utf-8 -*-
class OptionsController < ApplicationController

  def index
    @options = Option.all

    respond_to do |format|
      format.js { "$.fn.log('abc')" }
      format.html # index.html.erb
      format.json { render json: @options }
    end
  end

  def show
    @option = Option.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @option }
    end
  end

  def new
    @option = Option.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @option }
    end
  end

  def edit
    @option = Option.find(params[:id])
  end

  def create
    @option = Option.new(params[:option])
    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: 'Option was successfully created.' }
        format.json { render json: @option, status: :created, location: @option }
      else
        format.html { render action: "new" }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @option = Option.find(params[:id])

    respond_to do |format|
      if @option.update_attributes(params[:option])
        format.html { redirect_to @option, notice: 'Option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option = Option.find(params[:id])
    @option.destroy

    respond_to do |format|
      format.html { redirect_to options_url }
      format.json { head :no_content }
    end
  end
end
