module InvoicesHelper
	def getInvoiceValueWithTax(invoice_id)
		begin
			@inv = Invoice.find(invoice_id)
			if @inv.contracted_amount.present?
				res = (@inv.contracted_amount * 1.2)
			else
				res = 0
			end

			return res
		rescue=>error
			return 0
		end
	end
end
