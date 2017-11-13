# frozen_string_literal: true

class Crud::EventsController < CrudController
  before_action :authenticate_user!
  before_action :admin_user?

  self.permitted_attrs = %i[date time season score notes venue home_team_id
                            bookable_from bookable_until requested_seats poster_url
                            confirmed_seats away_team_id competition_id]
  self.search_columns = %i[date season home_team_id away_team_id competition_id
                           venue poster_url]

  include DatatableController

  def datatable_columns
    %i[date season bookable_from bookable_until home_team_id
       away_team_id competition_id venue poster_url]
  end

  def datatable_reservations
    event_id = params[:id]
    @response = Reservation.includes(:user).where(event_id: event_id)
    @data = @response.map do |r|
      ReservationDecorator.new(r).datatable_reservations
    end
    respond_to do |format|
      format.json { render 'shared/search' }
    end
  end
end
