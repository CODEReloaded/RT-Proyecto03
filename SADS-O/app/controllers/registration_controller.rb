class RegistrationController < Devise::RegistrationsController
	def new
	@member=Member.new
	end


	def create
	@member = Member.new
    @member.name = params[:member][:name]
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation =params[:member][:password_confirmation]
    @member.valid?
    if @member.errors.blank?

    @member.save
    redirect_to new_post_path
    else
    render :action => "new"
    end
    end	

end
