module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title}-暇な文系学生"
    else
      '暇な文系学生'
    end
  end
end
