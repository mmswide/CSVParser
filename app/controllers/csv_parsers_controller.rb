class CsvParsersController < ApplicationController
  require 'csv'
  def index
    @new_data = []
  end

  def new
  end

  def create
    # csv_text = File.read('...')
    @new_data = []

    csv_file = params[:csv_file]  #get the csv file from form
    CSV.foreach(csv_file.path, {:quote_char =>"\'", :headers => true}) do |row|
      process_csv(row)   #process each row of csv_file
    end



    # csv_text = params[:csv_content]
    # csv = CSV.parse(csv_text, :headers => true)
    # csv.each do |row|
    #   process_csv(row)
    # end # end each
    @new_data
    render action: :index
  end

  private
  def process_csv(row)
    url = row[0]
    range = row[1]
    pattern = row[2]
    street = row[3]
    company = row[4]
    suite = row[5]
    zip = row[6]

    if range.split.length == 3
      first_num = range.split('to')[0].delete('\"').to_i    # get first_num from range
      second_num = range.split('to')[1].to_i                #get second_num from range
      (first_num..second_num).step(2).to_a.each do |range_num|
        @new_data << [url, '"'+range_num.to_s+'"', '""', street, company, suite, zip].join(',')
      end

    else #else range.split.length == 1
      @new_data << [url, range, '""', street, company, suite, zip].join(',')
    end # end range.split
  end

end
