select
    p.name,
    pr.name

from products as p
inner join providers as pr on(p.id_providers = pr.id)
where p.id_categories = 6

    