# require "active_support/concern"
# require 'csv'
# require 'open-uri'

# module ImportData
#     extend ActiveSupport::Concern
#     def bulk_csv
          
#         @uri = "https://challenges.coode.sh/covid/data/covid-variants.csv"

#         @url_data = URI.open(@uri)
            
#        @csv = CSV.parse(@url_data, col_sep: "\n", headers: true)

#     end
# end