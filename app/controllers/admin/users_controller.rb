module Admin
  class UsersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super

      # if params.key?(:role)
      #   if params[:role] == "2"
      #     @resources = User.where(role: "2").order("updated_at DESC, created_at DESC").
      #     page(params[:page]).
      #     per(10)
      #   elsif params[:role] == "3"
      #     @resources = User.where(role: "3").order("updated_at DESC, created_at DESC").
      #     page(params[:page]).
      #     per(10)
      #   else
          # @resources = User.order("created_at DESC").
          # page(params[:page]).
          # per(10)
      #   end
      # end
      
    end


    def sellers
      search_term = params[:search].to_s.strip
      resources = Administrate::Search.new(scoped_resource,
                                           dashboard_class,
                                           search_term).run
      resources = apply_resource_includes(resources)
      resources = order.apply(resources)
      resources = resources.where(role: "2")
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: show_search_bar?,
      }
    end

    def professionals
     search_term = params[:search].to_s.strip
      resources = Administrate::Search.new(scoped_resource,
                                           dashboard_class,
                                           search_term).run
      resources = apply_resource_includes(resources)
      resources = order.apply(resources)
      resources = resources.where(role: "3")
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: show_search_bar?,
      }
    end

     def update
      if requested_resource.update(resource_params)
        redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end

    def confirm
      requested_resource.update(is_verified: true)
      
      redirect_to(
          [namespace, requested_resource],
          notice: translate_with_resource("update.success"),
      )
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information


    # def valid_action?(name, resource = resource_class)
    #   # %w[edit destroy].exclude?(name.to_s) && super
    #   %w[sellers professionals].include?(name.to_s) && super
    # end

    # def scoped_resource
    #     if params[:role] == "2"
    #       @resources = User.where(role: "2").order("created_at DESC").
    #       page(params[:page]).
    #       per(10)
    #     elsif params[:role] == "3"
    #       @resources = User.where(role: "3").order("created_at DESC").
    #       page(params[:page]).
    #       per(10)
    #     else
    #       @resources = User.order("created_at DESC").
    #       page(params[:page]).
    #       per(10)
    #     end        
    # end

    #  def resource_params
    #   params.require(:user).permit(permitted_attributes)
    #  end

    # def resource_params
    #   params.require(resource_name).permit(*permitted_attributes)
    # end

    # def permitted_attributes
    #   # dashboard.permitted_attributes
    #   [ :role ]
    # end
    
    # def user_params
    #   params.require(:user).permit(:role)
    # end

    def permitted_attributes
      dashboard.permitted_attributes << %w(role)
    end

  end
end
