class ContactsController < ApplicationController

  def index
    @refresh_params = refresh_params
    @contacts, @errors = Skipio::Contact.random(clear_cache)
  end

  def show
    @contact = Skipio::Contact.find(params[:id])
  end

  def send_message
    phone_mobile = sprintf("%+d", params[:pm])
    respond_to do |format|
      Skipio::Notifier.send_sms(phone_mobile)
      format.html{}
    end
  end

  def send_custom_message
    phone_mobile = sprintf("%+d", params[:pm])
    c_message = params[:msg]

    respond_to do |format|
      Skipio::Notifier.send_custom_sms(phone_mobile, c_message)
      format.html{}
    end
  end

  private

  def query
    params.fetch(:query, {})
  end

  def clear_cache
    params[:clear_cache].present?
  end

  def refresh_params
    refresh = { clear_cache: true }
    refresh.merge!({ query: query }) if query.present?
    refresh
  end

end
