require 'csv'
require 'open-uri'
require 'case'

class BulkData
    
    @uri = "https://challenges.coode.sh/covid/data/covid-variants.csv"
    @url_data = URI.open(@uri)    
    @csv = CSV.parse(@url_data, col_sep: "\n")   
    @cases = []
    
    for line in @csv do
            @array = line.to_s.tr('["',"").tr('"]',"").split(",")
            @cases << {location: @array[0], date: @array[1], variant: @array[2], num_sequences: @array[3], perc_sequences: @array[4], num_sequences_total: @array[5] }
    end

    Case.collection.insert_many(@cases)
end