class PagesController < ApplicationController
    def index
    end

    def about 
    end

    def contact 
        @members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine','abdelhak' ]
        if params[:member]
            @members = @members.select { |member| member.start_with? (params[:member].downcase)}
        end
    end
end
