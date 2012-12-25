# -*- encoding : utf-8 -*-
class ExamsController < ApplicationController

  def nested_action
    resources_name == controller_name ? action_name : "#{action_name}_nested"
  end

  before_filter :get_resource
  def index
    if resources_name == controller_name
      @instances = @klass.page(params[:page])
    else
      @instance = @klass.find(params["#{resource_name}_id".to_sym])
      # @instances = eval("#{@instance.to_s}.#{controller_name}").page(params[:page])
      @instances = @instance.send(controller_name).page(params[:page])
    end
    respond_to do |format|
      format.html { render nested_action}
      format.json { render json: @instances }
    end
  end

  def show
    if params[:user_id]
      @user = User.find(params[:user_id])
      @instance = Skill.find(params[:id])
    else
      @instance = @klass.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instance }
    end
  end

  def new
    @instance = @klass.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @instance }
    end
  end

  def edit
    @instance = @klass.find(params[:id])
  end

  def create
    @instance = @klass.new(params[resource_name.to_sym])
    respond_to do |format|
      if @instance.save
        format.html { redirect_to eval("#{@instance.class.to_s.underscore}_questions_path(@instance)"), notice: 'Exam was successfully created.' }
        format.json { render json: @instance, status: :created, location: @instance }
      else
        format.html { render action: "new" }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @instance = @klass.find(params[:id])

    respond_to do |format|
      if @instance.update_attributes(params[resource_name.to_sym])
        format.html { redirect_to @instance, notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instance = @klass.find(params[:id])
    @instance.destroy

    respond_to do |format|
      format.html { redirect_to eval("#{@instance.class.to_s.underscore.pluralize}_path") }
      format.json { head :no_content }
    end
  end
  private
  def get_resource
    if (@klass = resource_name.classify.constantize) && params[:id]
      @instance = @klass.find_by_id(params[:id])
      debug @instance, '@instance'
    end
    debug @klass, '@klass'
  end
end
