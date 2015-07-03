module CoursesHelper
  def form_season
    params[:season].try(:capitalize) || Quarter.active_quarter.
     try(:season).capitalize
  end

  def form_year
    params[:year] || Quarter.active_quarter.try(:year)
  end

  def edit_change_type
    @course.draft? ? "create" : "edit"
  end

  def form_preference
    @bid.new_record? ? "No preference" : @bid.preference
  end

  def formatted_title(course)
    course.title + (course.draft? ? " (Draft)" : "")
  end

  def formatted_status(course)
    course.draft? ? "Draft" : (course.published? ? "Published" : "Unpublished")
  end

  def render_syllabus(syllabus_html)
    # Produce desirable output from the html generated by TinyMCE
    out = syllabus_html

    # <h[n]>...</h[n]> => <h[n]><strong>...</strong></h[n]>
    out.gsub!(/(<h\d>)/, '\1<strong>')
    out.gsub!(/(<\/h\d>)/, '</strong>\1')

    out.html_safe
  end
end
