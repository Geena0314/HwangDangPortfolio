select		o_orders_no, orders_total_price, payment_status,
		op_order_seq_no, order_amount, order_product_status, 
		p_product_id, product_name, product_main_image,
		s_seller_store_no, seller_store_image,
		option_sub_name
		from	(select ceil(rownum/6) page, o_orders_no, orders_total_price, payment_status,
		op_order_seq_no, order_amount, order_product_status, 
		p_product_id, product_name, product_main_image,
		s_seller_store_no, seller_store_image,
		option_sub_name
						from (select 	o.orders_no o_orders_no, o.orders_total_price, o.payment_status,
											op.order_seq_no op_order_seq_no, op.order_amount, op.order_product_status, 
											p.product_Id p_product_id, p.product_name, p.product_main_image,
											s.seller_store_no s_seller_store_no, s.seller_store_image,
											po.option_sub_name
									from 		orders o, order_product op, product p, product_option po, seller s
									where 	o.orders_no = op.orders_no
									and	 	op.product_id = p.product_id
									and		op.option_id = po.option_id
									and		op.seller_store_no = s.seller_store_no 
									and		op.order_product_status IN (0,1,2,3,4) 
									and		o.member_id = 'hwang1@gmail.com'
									order by o.orders_date desc))
		where		page = 1