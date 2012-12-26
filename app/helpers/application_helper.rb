# -*- encoding : utf-8 -*-
require "redcarpet"
module ApplicationHelper

  def nl2br(text)
    text.gsub(/\n/, '<br/>')
  end

  def link_to_polymorphic(obj, opts={})
    link_to obj.title, polymorphic_path(obj)
  end

  # obj is Exam obj
  def link_to_build_questions(obj)
    link_to '新增考題', skill_questions_path(obj), :class => 'btn'
  end

  def link_to_build_sheet(obj, opts = {})
    # obj: Quiz is a Exam, Category stored in paperable
    return unless obj.questions_count > 0
    link_to '開始測驗', new_polymorphic_path([obj, Sheet.new]), :class => "btn #{opts[:class]}"
  end

  # obj is Exam object
  def link_to_build_response(obj, opts={})
    return unless obj.questions_count > 0
    link_to '開始測驗', new_polymorphic_path([obj, Response.new]), :class => "btn #{opts[:class]}"
  end

  def title(text)
    content_for :title, text
    "<h1>#{text}</h1>".html_safe
  end

  def flash_class(level)
    case level
    when :notice then 'info'
    when :error then 'error'
    when :alert then 'warning'
    end
  end

  def owner_tool(obj, opts = {})
    ##{link_to "Show", polymorphic_path(obj), :class => 'btn'}
    %Q(<div class='owner-tool btn-group'>
      #{opts[:pre]}
      #{link_to "Edit", edit_polymorphic_path(obj), :class => 'btn' if obj.owned?}
      #{link_to "Destroy", polymorphic_path(obj), :method => :delete, :confirm => "#{t("web-app-theme.confirm", :default => "Are you sure?")}", :class => 'btn', :remote => opts[:remote] if obj.owned?}
      </div>
    ).html_safe
  end

  def markdown(str, options = {})
    # XXX: the renderer instance should be a class variable
    options[:hard_wrap] ||= false
    options[:class] ||= nil
    assembler = Redcarpet::Render::HTML.new(:hard_wrap => options[:hard_wrap]) # auto <br> in <p>

    renderer = Redcarpet::Markdown.new(assembler, {
      :autolink => true,
      :fenced_code_blocks => true
    })
    content_tag(:div, raw(MarkdownConverter.convert(str)), :class => options[:class])
  end
end
