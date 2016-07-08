class Customer::RepliesController < Customer::Base
  before_action :prepare_message

  def new
    @reply = CustomerMessage.new
  end

  def confirm
    @reply = CustomerMessage.new(customer_message_params)
    if @reply.valid?
      render action: 'confirm'
    else
      flash.now.alert = '入力に誤りがあります。'
      render action: 'new'
    end
  end

  def create
    @reply = CustomerMessage.new(customer_message_params)
    if params[:commit]
      @reply.customer = current_customer
      @reply.parent = @message
      if @reply.save
        flash.notice = 'メッセージに返信しました。'
        redirect_to :customer_messages
      else
        flash.now.alert = '入力に誤りがあります。'
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end

  private
  def prepare_message
    @message = StaffMessage.find_by(id: params[:message_id], customer_id: current_customer.id)
  end

  def customer_message_params
    params.require(:customer_message).permit(:subject, :body)
  end
end
