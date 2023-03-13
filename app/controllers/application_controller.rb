class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories
  before_action :custom_renderer_paginate
  helper_method :logged_in?

  private

  def set_categories
    @categories = Category.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :phone, :email, :password) }
  end

  def custom_renderer_paginate
    @custom_renderer_paginate = Class.new(WillPaginate::ActionView::LinkRenderer) do
      def container_attributes
        {class: "pagination m-0 custom-pagination"}
      end

      def page_number(page)
        if page == current_page
          tag(:span, page, class: 'page-item active')
        else
          link(page, page, class: 'page-item', rel: rel_value(page))
        end
      end

      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<span class="mr2">#{text}</span>)
      end

      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        # previous_or_next_page(num, @options[:previous_label], 'page-item')
        previous_or_next_page(num, "<<", 'page-item')
      end

      def next_page
        num = @collection.current_page < total_pages && @collection.current_page + 1
        # previous_or_next_page(num, @options[:next_label], 'page-item')
        previous_or_next_page(num, ">>", 'page-item')
      end

      def previous_or_next_page(page, text, classname)
        if page
          link(text, page, :class => classname)
        else
          tag(:span, text, :class => classname + ' disabled')
        end
      end
    end
  end

  def authorized
    redirect_to '/users/sign_in' unless current_user?
  end

  def authorized_json
    render json: 'Failed', status: '401' unless !current_user.nil?
  end

end
