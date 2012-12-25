# -*- encoding : utf-8 -*-
class QuestionsController < ApplicationController

  def index
    @exam = get_exam
    @questions = @exam.questions.page(params[:page]).order('updated_at desc')
    @question = @exam.questions.new

    respond_to do |format|
      format.html {}
      format.json { render json: @questions }
    end
  end

  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @question }
    end
  end

  def new
    @question = get_exam.questions.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      if @question.save
        format.html { redirect_to skill_questions_path(@question.quiz), notice: 'Question was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to skill_questions_path(@question.quiz), notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @target = dom_id(@question)
    @question.destroy if @question
    respond_to do |format|
      format.js{}
    end
  end

  private
  def get_exam
    return unless id = params["#{resource_name}_id".to_sym]
    resource_name.classify.constantize.find(id)
  end
end
