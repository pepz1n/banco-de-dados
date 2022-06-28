select 
    p.name

from providers as p
where p.name = 'Ajax SA'
where p.id in(select id_providers from products)