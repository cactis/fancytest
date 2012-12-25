# -*- encoding : utf-8 -*-
class ResponsesController < ApplicationController

  def index
    @responses = Response.page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  def show
    @response = Response.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @response }
    end
  end

  def new
    @quiz = get_exam
    @question = params[:question_id] ? Question.find(params[:question_id]) : @quiz.next_question
    @response = @question.responses.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @response }
    end
  end

  def edit
    @response = Response.find(params[:id])
  end

  def create
    @response = Response.new(params[:response])
    respond_to do |format|
      if @response.save
        # 利用答題的結果取得下一題
        # format.html { redirect_to new_polymorphic_path([@response.question.quiz, @response.question.quiz.next_question, Response.new]), notice: @response._result }
        format.html { redirect_to new_polymorphic_path([@response.question.quiz, @response.question.quiz.sheets.new]), notice: @response._result}
        format.json { render json: @response, status: :created, location: @response }
      else
        format.html { render action: "new" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @response = Response.find(params[:id])
    respond_to do |format|
      if @response.update_attributes(params[:response])
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end
  private
  def get_exam
    return unless id = params["#{resource_name}_id".to_sym]
    resource_name.classify.constantize.find(id)
  end
end
