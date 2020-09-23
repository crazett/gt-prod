class GtsController < ApplicationController
    def index
        @gts = Gt.all
    end
end
