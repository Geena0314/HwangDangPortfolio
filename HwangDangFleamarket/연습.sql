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
				and 		p.product_name like '%%'
				order by 	p.product_like desc))
where page = 1

select 	p.product_Id, p.product_name, p.product_price, p.product_stock, p.product_main_image, p.product_info, p.product_like, p.seller_store_no, 
		   	s.seller_store_no, s.seller_store_name, s.seller_tax_id, s.seller_industry, s.seller_sub_industry, s.seller_zipcode, s.seller_address, 
		   	s.seller_sub_address, s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3, s.seller_introduction, s.seller_assign, s.member_id,
			i.image_path, i.product_id
from		product p, seller s, product_detail_image i
where  	p.seller_store_no = 4
and	  	p.product_id = '상품id5555'
and    	p.seller_store_no = s.seller_store_no
and    	p.product_id = i.product_id


select 	p.product_Id, p.product_name, p.product_price, p.product_stock, p.product_main_image, p.product_info, p.product_like, p.seller_store_no, 
	  		s.seller_store_no, s.seller_store_name, s.seller_tax_id, s.seller_industry, s.seller_sub_industry, s.seller_zipcode, s.seller_address, 
	   		s.seller_sub_address, s.seller_store_image, s.seller_product1, s.seller_product2, s.seller_product3, s.seller_introduction, s.seller_assign, s.member_id,
	   		po.option_id, po.option_name, po.option_sub_name, po.option_stock, po.option_add_price, po.product_id
from   	product p, seller s, product_option po 
where  	p.seller_store_no = s.seller_store_no
and	   	p.product_id = 'ironMan07'
and    	p.product_id = po.product_id
and		po.option_id = 23