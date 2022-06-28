select 
    p.name,
    pro.name,
    c.name

from products as p
join providers as pro on (p.id_providers = pro.id)
join categories as c on (p.id_categories = c.id)

where pro.name = 'Sansul SA' and c.name = 'Imported'