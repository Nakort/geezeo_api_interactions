class TransactionList

  include Enumerable
  attr_reader :current_page, :total_pages

  def initialize(transactions, pagination)
    @transactions = transactions.map{|t| Transaction.new(t)}
    @current_page = pagination["current_page"]
    @total_pages = pagination["total_pages"]
  end

  def each &block
    @transactions.each &block
  end

end
