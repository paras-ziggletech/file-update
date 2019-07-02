class HomeController < ApplicationController
    def index
        @name = 'amit'

        @age = '26'
    end

    def admin

        if Page.first == nil
        index = Page.new
        index.data = File.read(Rails.root.join('app', 'views', 'home', 'index.html.erb'))
        index.save
        end

        build_dummy_data
        data = ERB.new(Page.first.data)
        @data = data&.result(binding)
        
        

    end

    def save_page
        index = Page.first
        index.data = params[:page][:data]
        index.save

        if params[:commit] == 'Publish'

            file = File.open(Rails.root.join('app', 'views', 'home', 'index.html.erb'),'w')
            file.puts params[:page][:data]
            file.close
    
            redirect_to index_path
        elsif params[:commit] == 'Save'
            index = Page.first
            index.data = params[:page][:data]
            index.save
    
    
            redirect_to admin_path
        end
        
       
    end

    def resync

        index = Page.first
        index.data = File.read(Rails.root.join('app', 'views', 'home', 'index.html.erb'))
        index.save

        redirect_to admin_path
    end


    private

    def build_dummy_data
        @name = 'test'

        @age = '12'
    end

end
