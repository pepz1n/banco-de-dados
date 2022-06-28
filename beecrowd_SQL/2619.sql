select 
    p.name,
    pro.name,
    p.price

from products as p
join providers as pro on (p.id_providers = pro.id)
join categories as c on (p.id_categories = c.id)

where p.price > 1000 and c.name = 'Super Luxury'