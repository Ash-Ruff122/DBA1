use ap; 

#1 
select * 
from vendors 
order by vendor_id; 

#2
select vendor_name, vendor_phone, vendor_city
from vendors 
where vendor_state = "CA"                                                        # sorts the vendors table by vendor_state ONLY that are in CA 
order by vendor_name; 

#3
select invoice_id, invoice_total, invoice_date 
from invoices 
order by invoice_total desc;                                                    # orders by invoice total Descending 

#4
select invoice_id, invoice_total
from invoices
order by invoice_total 
limit 3, 6;                                                                       # limits the total amount of results into the 3rd lowest to the 9th lowest results of invoices

#5
select invoice_id, invoice_total, invoice_total - payment_total                # this takes invoice_total and takes away the payment_total and creates a new "variable" as remaining balence which can then be dispayed as a collum 
        as remaining_balence
from invoices
order by invoice_total;



#6
select invoice_id, invoice_total, vendor_name, vendor_phone                       # inner joins invoices and vendors into one table so you can use 2 seperate tables at once 
from invoices inner join vendors
order by invoice_id;

#7
select * from vendors, invoices;
select vendor_name, invoice_id 
from vendors
left join invoices on vendors.vendor_id = invoices.vendor_id                   # this took forever im not even sure how i got it to be honest i was looking at the power point.
order by vendor_name;                                                            # more or less selected everything from vendors, invoices. then left joined invoices on vendors 

#8
 use ex; 
 select department_name, last_name
 from departments 
 left join employees on employees.department_number = departments.department_number
 order by departments.department_number;
 
 #9 
 select CONCAT(vendor_contacts.first_name, ' ', vendor_contacts.last_name) as 'Combined contact name', vendor_name
 from vendor_contacts
 left join vendors on vendor_contacts.vendor_id = vendors.vendor_id
 order by 'Combined Contact name';
 
 #10
select distinct first_name 
from employees
union 
select distinct rep_first_name #
from sales_reps
order by first_name;

#11
use ap;
select invoice_id, invoice_total, vendor_name, terms_description
from invoices
left join vendors on invoices.vendor_id = vendors.vendor_id                    #multiple joins to create a large output table from multiple different tables (invoices, terms, vendors) 
left join terms on terms.terms_id = vendors.default_terms_id  
order by invoice_id;
 

 



