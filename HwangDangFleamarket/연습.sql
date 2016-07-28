select		op.order_seq_no, op.order_amount, op.product_id, op.option_id, 
			op.seller_store_no, po.option_sub_name
from		order_product op, product_option po
where		op.option_id = po.option_id
and		op.order_seq_no = 57