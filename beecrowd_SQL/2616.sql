select 
    c.id,
    c.name

from locations as l
join customers as c on (l.id_customers = c.id)
where l.id_customers not in (c.id)