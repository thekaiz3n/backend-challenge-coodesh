class Case
  include Mongoid::Document
  include Mongoid::Timestamps
  field :location, type: String
  field :date, type: String
  field :variant, type: String
  field :num_sequences, type: Integer
  field :perc_sequences, type: Float
  field :num_sequences_total, type: Integer

  validates :date, presence: true, allow_blank: false,format: {with: /[a-zA-Z]/}


  def self.get_by_date(date)
    Case.where(date: date)
  end

  def self.get_all_dates
    Case.collection.distinct("date")
  end
end
