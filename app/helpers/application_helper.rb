module ApplicationHelper
  @@breadcrumb = []
  def breadcrumb(pagina, reset)
    html = ""
    item = Array.new
    if !@@breadcrumb or reset == true
    @@breadcrumb = []
    end
    html << "<div class='page-title'> <h1>#{pagina}</h1>"
    html << "<span>"
    item = {:pagina => pagina, :actionName => params[:action], :controllerName => params[:controller], :id => params[:id]}
    if !@@breadcrumb.include?(item)
    @@breadcrumb.push(item)
    end
    for crumb in @@breadcrumb
      if crumb != item && crumb != nil
        html << "#{link_to(:controller => crumb[:controllerName], :action => crumb[:actionName]){crumb[:pagina]}} > "
      end
    end
    html << pagina.to_s
    html << "</span></div>"
    html.html_safe
  end

  def paginate (total)
    html = ""
    action = "index"
    if params[:offset] != nil
      offset = params[:offset]
    end
    if params[:max] != nil
      max = params[:max]
    end
    maxsteps = 10
    if !offset
    offset =  0
    end
    if !max
    max = 10
    end
    linkParams = Hash.new
    linkParams[:offset] = offset - max
    linkParams[:max] = max
    linkTagAttrs = {:action => params[:action], :controller => params[:controller], :params => linkParams}
    steps = maxsteps > 0
    currentstep = (offset / max) + 1
    firststep = 1
    laststep = ((total / max).ceil).round
    if (laststep > 1)
      html << "<div class='paginacao'>"
    end
    if currentstep > firststep
      htmlclass = 'prevLink btn_no_text btn ui-state-default ui-corner-all prev'
      linkParams[:offset] = offset - max
      html << link_to("<span class=\'ui-icon ui-icon-circle-arrow-w\'></span>".html_safe, 
      url_for(linkTagAttrs), {:class => htmlclass})
    end
    if steps && laststep > firststep
      htmlclass = 'step'
      for i in 1..laststep
        if currentstep == i
          html << "<span class=\"currentStep\">#{i}</span>"
        else
          linkParams[:offset] = (i - 1) * max
          html << link_to(i.to_s, url_for(linkTagAttrs), {:class => htmlclass})
        end
      end
    end
    if currentstep < laststep
      htmlclass = 'nextLink btn_no_text btn ui-state-default ui-corner-all next'
      linkParams[:offset] = offset + max
      html << link_to("<span class=\'ui-icon ui-icon-circle-arrow-e\'></span>".html_safe, url_for(linkTagAttrs), {:class => htmlclass})
    end
    if (laststep > 1)
      html << "</div>"
    end
    html.html_safe
  end

end