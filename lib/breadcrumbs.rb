module Breadcrumbs

  module InstanceMethods

    protected

    # Append a breadcrumb to the end of the trail
    def add_breadcrumb(name, url =  nil)
      @breadcrumbs ||= []
      url = send(url) if url.is_a?(Symbol)
      name = send(name).to_s.titleize if name.is_a?(Symbol)
      @breadcrumbs << [name, url]
    end

  end

  module ClassMethods

    # Append a breadcrumb to the end of the trail by deferring evaluation
    # until the filter processing.
    def add_breadcrumb(name, url = nil, options = {})
      before_filter(options) do |controller|
        controller.send(:add_breadcrumb, name, url)
      end
    end

  end

  module HelperMethods

    # Returns HTML markup for the breadcrumbs
    def breadcrumbs(*args)
      default_options = {:separator => "&nbsp;&raquo;&nbsp;", :tag => :li}
      options = default_options.merge(args.extract_options!)
      if @breadcrumbs
        @breadcrumbs.map do |name, url|
          if options[:no_link].to_s == 'last'
            crumb = unless [name, url] == @breadcrumbs.last
              link_to( name, url)
            else
              content_tag("span", name)
            end
          else
            crumb = link_to_unless_current(name, url)
          end
          options[:tag] && content_tag(options[:tag], crumb) || crumb
        end.join("#{options[:separator]}")
      end
    end

  end

end

class ActionController::Base
  include Breadcrumbs::InstanceMethods
  helper_method :add_breadcrumb
end

ActionController::Base.extend(Breadcrumbs::ClassMethods)
ActionView::Base.send(:include, Breadcrumbs::HelperMethods)

