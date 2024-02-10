select * from album;
select * from employee
order by levels desc limit 1;
select * from invoice;

select billing_country , count(invoice_id) as total_count from invoice
group by billing_country order by total_count desc limit 1;
select total from invoice order by total desc limit 3 ;

select billing_city, sum(total) from invoice as total_sum group by billing_city order by sum(total) desc;
select * from customer;

select customer.customer_id , customer.first_name, customer.last_name, sum(total) as total  from customer 
join invoice on customer.customer_id = invoice.customer_id group by customer.customer_id order by total desc;

select * from genre;
select distinct customer.email, customer.first_name, customer.last_name from customer 
join invoice on customer.customer_id = invoice.customer_id 
join invoice_line on invoice.invoice_id = invoice_line.invoice_id where track_id in 
(select track_id from track 
join genre on track.genre_id = genre.genre_id 
where genre.name like 'Rock')
order by customer.email;

select * from artist;
select * from track;
select * from album;
select * from genre;

select  artist.name, count( artist.name)  as number_of_songs from artist  
join album on artist.artist_id = album.artist_id  
join track on  album.album_id= track.album_id
join genre on track.genre_id =genre.genre_id 
where genre.name like  'Rock'
group by artist.name
order by number_of_songs desc
limit 10;

select  artist.name, count(artist.name)  as number_of_songs from track 
join album on album.album_id  = track.album_id 
join artist on  artist.artist_id= album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like  'Rock'
group by artist.name
order by number_of_songs desc
limit 10;

select * from artist;
select * from track;
select * from album;
select * from genre;
select track.name, track.milliseconds from track where track.milliseconds > (select avg(track.milliseconds) from track)
order by track.milliseconds desc;																			 
																













