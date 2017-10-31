# frozen_string_literal: true

class Crud::EventsController < CrudController
  before_action :authenticate_user!
  before_action :admin_user?

  self.permitted_attrs = %i[date time season score notes home_team_id
                            away_team_id competition_id venue poster_url]
  self.search_columns = %i[date season home_team_id away_team_id competition_id
                           venue poster_url]

  include DatatableController

  def datatable_columns
    %i[date season home_team_id away_team_id competition_id
       venue poster_url]
  end
end
