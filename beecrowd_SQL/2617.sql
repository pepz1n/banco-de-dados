select
    pr.name,
    p.name

from providers as p
join products as pr on (p.id = pr.id_providers)
where p.name = 'Ajax SA'