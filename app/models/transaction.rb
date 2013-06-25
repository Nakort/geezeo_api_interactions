class Transaction < OpenStruct

  def debit?
    transaction_type == "Debit"
  end

  def credit?
    transaction_type == "Credit"
  end


  def date
    Time.parse(self.posted_at).strftime("%m-%d-%Y")
  end
end
