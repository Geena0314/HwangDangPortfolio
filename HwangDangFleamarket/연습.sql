select		op.order_seq_no, op.order_amount, op.product_id, op.option_id, 
			op.seller_store_no, po.option_sub_name
from		order_product op, product_option po
where		op.option_id = po.option_id
and		op.order_seq_no = 57

UPDATE 		member
SET			member_mileage = member_mileage+1000
WHERE		member_id = 'isj4216@hanmail.net'

select code_name from code where code = 'search'

select seller_store_no from seller where seller_assign = 1 and seller_product1 like '%2%' or seller_product2 like '%2%' or seller_product3 like '%2%'

select count(product_id) from product

select seller_store_no, seller_store_name, seller_tax_id, seller_industry, 
		seller_sub_industry, seller_zipcode, seller_address, seller_sub_address, 
		seller_store_image, seller_product1, seller_product2, seller_product3, 
		seller_introduction, seller_assign, member_id from(
			select ceil(rownum /6)page, seller_store_no, seller_store_name, seller_tax_id, seller_industry, 
		seller_sub_industry, seller_zipcode, seller_address, seller_sub_address, 
		seller_store_image, seller_product1, seller_product2, seller_product3, 
		seller_introduction, seller_assign, member_id from(
				select 	seller_store_no, seller_store_name, seller_tax_id, seller_industry, 
		seller_sub_industry, seller_zipcode, seller_address, seller_sub_address, 
		seller_store_image, seller_product1, seller_product2, seller_product3, 
		seller_introduction, seller_assign, member_id 
				from 		seller 
				where 	seller_assign = 1 
				and		seller_product1 like '%하드 케이스%'
				or			seller_product2 like '%하드 케이스%'
				or			seller_product3 like '%하드 케이스%'
				order by seller_store_no DESC) 
				) where page = 1
				
select product_Id, product_name, product_price, product_main_image, p_seller_store_no, s_seller_store_image
		from (select ceil(rownum/6) page, product_Id, product_name, product_price, product_main_image, p_seller_store_no, s_seller_store_image
				from (select 	p.product_Id, p.product_name, p.product_price, p.product_main_image, p.seller_store_no p_seller_store_no, 
									s.seller_store_image s_seller_store_image
						from 		product p, seller s
						where		p.seller_store_no = s.seller_store_no
						and 	p.product_name like '%%'
						order by p.product_like desc))
		where page = 1