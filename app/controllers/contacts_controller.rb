class ContactsController < ApplicationController

  def index
    @refresh_params = refresh_params
    @contacts, @errors = Skipio::Contact.random(clear_cache)
  end

  def show
  end

  def send_message
    respond_to do |format|
      Skipio::Notifier.send_sms
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
