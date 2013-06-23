class Transaction < OpenStruct

  def debit?
    transaction_type == "Debit"
  end

  def credit?
    transaction_type == "Credit"
  end

end
