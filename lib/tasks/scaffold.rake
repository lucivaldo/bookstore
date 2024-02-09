namespace :scaffold do

  desc "Gera o scaffold inicial da aplicação"
  task generate: :environment do
    scaffold_commands_map = {
      'Author' => "rails generate scaffold author first_name:string last_name:string title:string",
      'Book' => "rails generate scaffold book title:string year_published:integer isbn:string 'price:decimal{10,2}' out_of_print:boolean views:integer supplier:references author:references",
      'Customer' => "rails generate scaffold customer first_name:string last_name:string title:string email:string visits:integer orders_count:integer lock_version:integer",
      'Order' => "rails generate scaffold order date_submitted:time status:integer 'subtotal:decimal{10,2}' 'shipping:decimal{10,2}' 'tax:decimal{10,2}' 'total:decimal{10,2}' customer:references",
      'Review' => "rails generate scaffold review title:string body:text rating:integer state:integer customer:references book:references",
      'Supplier' => "rails generate scaffold supplier name:string"
    }

    scaffold_commands_map.each do |model, command|
      puts "-" * 30
      puts model
      puts "-" * 30

      system(command)

      puts
    end
  end
end
