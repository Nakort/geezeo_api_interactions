class TransactionList

  include Enumerable

  attr_reader :current_page, :total_pages

  def initialize(attrs)
    transactions = attrs[:transactions]
    pagination = attrs[:pagination]
    @transactions = transactions.map{|t| Transaction.new(t)}.sort.reverse
    @current_page = pagination["current_page"].to_i
    @total_pages = pagination["total_pages"].to_i
  end

  def each &block
    @transactions.each &block
  end

  def to_csv
    CSV.generate do |csv|
      cols = ["id", "transaction_type", "balance", "memo"]
      csv << cols
      self.each do |tr|                
        csv << [tr.id, tr.transaction_type, tr.balance, tr.memo]
      end
    end
  end

end
