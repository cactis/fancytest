# -*- encoding : utf-8 -*-
class SheetsController < ApplicationController

  def index
    @sheets = Sheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sheets }
    end
  end

  def show
    @sheet = Sheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sheet }
    end
  end

  def new
    @skill = Skill.find(params[:skill_id])
    if @sheet = @skill.sheets.created_by_current_user.first
    else
      @sheet = @skill.sheets.create
    end
    if @question = @skill.next_question
      @response = @sheet.responses.new(:paperable => @question)
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @sheet }
      end
    else
      # redirect_to user_skill_path(current_user, @skill), :notice => '已無適當題目可作。'
      redirect_to skill_user_path(@skill, current_user), :notice => '已無適當題目可作。'
    end


  end

  def edit
    @sheet = Sheet.find(params[:id])
  end

  def create
    @sheet = Sheet.new(params[:sheet])
    respond_to do |format|
      if @sheet.save
        format.html { redirect_to @sheet, notice: 'Sheet was successfully created.' }
        format.json { render json: @sheet, status: :created, location: @sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sheets/1
  # PUT /sheets/1.json
  def update
    @sheet = Sheet.find(params[:id])

    respond_to do |format|
      if @sheet.update_attributes(params[:sheet])
        format.html { redirect_to @sheet, notice: 'Sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sheets/1
  # DELETE /sheets/1.json
  def destroy
    @sheet = Sheet.find(params[:id])
    @sheet.destroy

    respond_to do |format|
      format.html { redirect_to sheets_url }
      format.json { head :no_content }
    end
  end
end
