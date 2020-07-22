module StaticPagesHelper
  def check_title(page_name = '')
    app_title = 'Customer Enquiries App'

    if page_name.empty?
      app_title
    else
      page_name + ' | ' + app_title
    end
  end
end
