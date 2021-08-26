class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end
  def create
    @email = Email.new(object: Faker::Book.title, body: Faker::Quote.matz, read: false)
    
    if @email.save
      respond_to do |format|
        format.html { redirect_to books_path }
        format.js { }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end 
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
    @email = Email.find(params[:id])
    @email.destroy
  end

  def update
    @email = Email.find(params[:id])
    
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
    if @email.read == true
      @email.update(read: false)
    else 
      @email.update(read: true)
    end 
  end
end
