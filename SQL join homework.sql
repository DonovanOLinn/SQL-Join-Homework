--List all customers who live in Texas
select * 
from address
--customer table to address district
select first_name, last_name, district
from customer 
inner join address 
on customer.address_id = address.address_id
where district = 'Texas'

--answer:Kim Cruz, Jennifer Davis, Bryan Hardison, Ian Still, Richard Mccrary

--Get all payments above $6.99 with the Customer's Full Name
--payment table to customer_id
select amount, first_name, last_name
from payment 
inner join customer 
on payment.customer_id = customer.customer_id 
where payment.amount > 6.99
--answer:See code above for list of payments

--Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
)
--answer:Harold Martino, Douglas Graf, Rhonda Kennedy, Clara Shaw, Marion Snyder, Elizabeth Brown, Jennifer Davie, Eleanor Hunt, Peter Menard, Karl Seal, Tommy Collazo, Mildred Bailey

--LIst all customers that live in Nepal(use the city table)

select customer.first_name, customer.last_name, country.country
from customer
join address
on customer.address_id = address.address_id 
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country.country = 'Nepal';

--answer:Kevin Schuler

--Which staff member ahd the most transactions?
select staff_id  
from payment

select count(payment.staff_id), staff.first_name, staff.last_name 
from payment
join staff
on payment.staff_id = staff.staff_id 
group by staff.first_name, staff.last_name 
--answer Jon Stephens had more transactions

--how many movies of each rating are there?
select count(film.rating), film.rating
from film_category
join film 
on film_category.film_id = film.film_id 
group by film.rating
--answer: 223 Pg-13, 209 NC-17, 179 G, 194 PG, 195 R

--Show all customers who have made a single payment above $6.99 (Use subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
)
--answer: See above code for list of people with a single payment above 6.99

--How many free rentals did our stores give away?
select * from rental
select * from inventory
select * from film
select * from payment
where amount = 0

select payment.amount, film.title
from payment 
join rental 
on payment.rental_id = rental.rental_id 
join inventory
on rental.inventory_id = inventory.inventory_id
join film
on inventory.film_id = film.film_id 
where payment.amount = 0
--answer: See the above code for title of the rental that the store gave away for free