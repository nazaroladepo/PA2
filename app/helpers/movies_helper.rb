module MoviesHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == session[:sort] && session[:direction] == "asc") ? "desc" : "asc"

    link_to "#{title} #{sort_arrow(column)}".html_safe, { sort: column, direction: direction }
  end

  def sort_arrow(column)
    return "" unless column == session[:sort]
    session[:direction] == "asc" ? "▲" : "▼"
  end


  def highlight_column(column)
    return "" unless column == params[:sort]

    params[:direction] == "asc" ? "sorted-asc" : "sorted-desc"
  end
end
