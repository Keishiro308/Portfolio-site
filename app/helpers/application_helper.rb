module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title}-KIROKU"
    else
      'KIROKU'
    end
  end
end
