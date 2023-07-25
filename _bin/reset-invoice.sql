set @invoice := 417574;
-- modify the invoice
-- payrix payment test amounts https://payrix.atlassian.net/servicedesk/customer/portal/5/article/45285490
select * from liveauct_liveauctioneers.auctioneers_auct_invoice where invID = @invoice;
-- delete by invoice
SET SQL_SAFE_UPDATES = 0;
delete from redstripe.lot_detail where invoice_number in (@invoice);
delete from redstripe.transaction where invoice_number in (@invoice);
delete from liveauct_liveauctioneers.auctioneers_auct_invoice_payments where invID in (@invoice);
delete from liveauct_liveauctioneers.auctioneers_auct_invoice_extra_charges where invID in (@invoice) and c_name = 'Processing fee' and explanation = 'Bidder-paid';
delete from Risk.Case where invoiceId = (@invoice);
SET SQL_SAFE_UPDATES = 1;
-- find the transactions
select * from redstripe.lot_detail where invoice_number = (@invoice);
select * from redstripe.transaction where invoice_number = @invoice;
select * from liveauct_liveauctioneers.auctioneers_auct_invoice_payments where invID = @invoice;
select * from Risk.Case where invoiceId = @invoice;0
