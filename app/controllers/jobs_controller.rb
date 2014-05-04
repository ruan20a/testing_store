class JobsController < ApplicationController
	before_filter :authenticate_user!
	def invite_user
		@user = User.invite!(:email => params[:user][:email], :name => params[:user][:name])
		render :json => @user
	end
	
	def index
	@jobs = Job.all
	end
	def new
	@job = Job.find_by_id(params[:id])
	end
	def show
    @job = Job.find_by_id(params[:id])
  	end
	def create
  	@job = Job.new(job_params)
 
  	@job.save
  	redirect_to @job
	end
 
	private
  	def job_params
    params.require(:job).permit(:name, :job_name, :description, :city, :state, :recuiter_id, :referral_fee)
  	end
end
