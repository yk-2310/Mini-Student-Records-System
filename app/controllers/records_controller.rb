class RecordsController < ApplicationController

	http_basic_authenticate_with name: "teacher", password: "teacher", except: [:home]
	@@count = 1
	def index
		@records = Record.all
	end

	def new
		@record = Record.new()
	end

	def edit
  		@record = Record.find(params[:id])
	end

	def update
	    @record = Record.find(params[:id])
	 
	  if @record.update(record_params)
	    redirect_to @record
	  else
	    render 'edit'
	  end
	end

	def create
		@record = Record.new(record_params)

		if @record.save
			redirect_to @record
		else
			render 'new'
		end
	end

	def show
	    @record = Record.find(params[:id])
	end

	def destroy
	  	@record = Record.find(params[:id])
	  	@record.destroy
	    
	  	redirect_to records_path
	end

	def destroyAll
		@records = Record.all 
		@records.each do |r|
			r.destroy
		end
		@@count=1
		redirect_to records_path
	end

	def getRandomNumber
		sum=0
		mul=10000
		5.times do |j|
			i=rand(1..9)
			sum+=i*mul
			mul=mul/10
 		end
 		return sum
 	end

	def duplicate
		10.times do |i|
		num= getRandomNumber()
  		@record=Record.new(studentid: num , sname: "student #{@@count}")
        @record.save
        @@count += 1
		end
		redirect_to records_path
	end

	def search
		@recordsearch =Record.where("sname = ?", params[:record][:sname])
		if @recordsearch.any?
			puts "5"
		end
	end

	
	private
		def record_params
			params.require(:record).permit(:studentid,:sname,:dob,:father,:mother,:phno,:email)
		end
end
