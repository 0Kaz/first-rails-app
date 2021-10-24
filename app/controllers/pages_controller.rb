class PagesController < ApplicationController
    def index
    end

    def about 
    end

    def contact 
        @members = [ 'salma','loubna','yassine','assem','abdullah','amine','yassine' ]
    end
end
