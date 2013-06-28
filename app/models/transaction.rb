class Transaction < OpenStruct

  def debit?
    transaction_type == "Debit"
  end

  def credit?
    transaction_type == "Credit"
  end

  def <=>(transaction)
    val = self.time <=> transaction.time
    if val == 0
      val = self.memo <=> transaction.memo
    end
    val
  end

  def date
    time.strftime("%m-%d-%Y")
  end

  def time
    Time.parse(self.posted_at)
  end
end
