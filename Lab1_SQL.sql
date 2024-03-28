use e_commerce;
select c.cus_gender as Gender, count(c.cus_gender) as Count from customer c inner join orders o on c.cus_id=o.cus_id 
where o.ord_amount >= 3000
group by c.cus_gender;

select c.cus_id,c.cus_name,p.pro_name,pdt.prod_id,o.ord_id,o.ord_amount,o.ord_date
from customer c, orders o, product p, product_details pdt
where 
c.cus_id=o.cus_id and o.prod_id=pdt.prod_id and p.pro_id=pdt.pro_id and 
c.cus_id=2;

select s.Supp_name,s.Supp_id,s.Supp_City,s.Supp_phone from supplier s inner join
(	select distinct(Supp_id) from product_details
    group by Supp_id
    having count(Supp_id)>1
) as pdt
on s.Supp_id=pdt.Supp_id;



select c.cus_name,c.cus_gender from customer c
where c.cus_name like '%a%' or '%A%' ;

select p.pro_id,p.pro_name from orders o, product p, product_details pdt 
where 
o.prod_id=pdt.prod_id
and p.pro_id=pdt.pro_id
and o.ord_date >='2021-10-05';

select * from
orders o, product p, product_details pd,category c
where 
o.prod_id=pd.prod_id
and p.pro_id=pd.pro_id
and p.cat_id=c.cat_id
order by o.ord_amount;

select customer.cus_id,customer.cus_name,customer.cus_phone,customer.cus_city,customer.cus_gender
 from customer 
left join orders on
customer.cus_id=orders.cus_id;


set sql_mode="";
select category.* from orders inner join product_details on 
orders.prod_id=product_details.prod_id 
inner join product on product.pro_id=product_details.pro_id
inner join category on category.cat_id=product.cat_id having (min(orders.ord_amount));


select * from
customer as cus inner join rating as rat 
on cus.cus_id=rat.cus_id
inner join supplier as sup
on sup.Supp_id=rat.Supp_id
having max(rat.rat_ratstars);




