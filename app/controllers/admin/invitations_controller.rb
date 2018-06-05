module Admin
  class InvitationsController < Admin::ApplicationController
    skip_before_filter :verify_authenticity_token, :only => [:generate]

    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Invitation.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Invitation.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information


    def generate
      # 随机生成100个邀请码
      i = 0
      while i < 100 do

        rand = 6.times.map { rand(0..9) }.join
        invitations = Invitation.where(invitation_code: rand)
        unless invitations.any? 
          invitation = Invitation.new(
            invitation_code: rand,
            has_activated: false
          )
          invitation.save!
        end
        i = i + 1         
      end
    end
  end
end
