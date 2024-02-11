namespace :scaffold do

  desc "Gera o scaffold inicial da aplicação"
  task generate: :environment do
    scaffold_commands_map = {
      'Author' => "author first_name last_name title",
      'Supplier' => "supplier name",
      'Book' => "book title year_published:integer isbn 'price:decimal{10,2}' out_of_print:boolean views:integer supplier:references author:references",
      'Customer' => "customer first_name last_name title email visits:integer orders_count:integer lock_version:integer",
      'Order' => "order date_submitted:time status:integer 'subtotal:decimal{10,2}' 'shipping:decimal{10,2}' 'tax:decimal{10,2}' 'total:decimal{10,2}' customer:references",
      'Review' => "review title body:text rating:integer state:integer customer:references book:references",
      'Books Orders' => "books_order order:references book:references",
    }

    scaffold_commands_map.each do |model, command|
      puts "-" * 30
      puts model
      puts "-" * 30

      system("rails g scaffold #{command}")

      puts
    end
  end
end
