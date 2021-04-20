use pubs;

--a)
SELECT * FROM authors;

--b)
SELECT au_lname, au_fname, phone FROM authors;

--c)
SELECT au_fname, au_lname, phone FROM authors
ORDER BY au_fname, au_lname;

--d)
select au_fname as first_name, au_lname as last_name, phone as telephone
from authors
order by au_fname, au_lname;

--e)
SELECT au_fname as first_name, au_lname as last_name, phone as telephone
FROM authors
WHERE state='CA' AND au_lname!='Ringer'
ORDER BY first_name, last_name;

--f)
select pub_name
from publishers
where pub_name like '%Bo%';

--g)
SELECT pub_name
FROM publishers JOIN titles ON publishers.pub_id=titles.pub_id
WHERE titles.[type]='Business'
GROUP BY pub_name;

--h)
select P.pub_id, sum(T.ytd_sales) as pub_sales
from titles as T 
	join publishers as P on T.pub_id=P.pub_id
group by P.pub_id;

--i)
SELECT publishers.pub_id, publishers.pub_name, title, sum(qty)
FROM publishers JOIN titles ON publishers.pub_id=titles.pub_id JOIN sales ON titles.title_id=sales.title_id
GROUP BY publishers.pub_id, publishers.pub_name, title;

--j)
select T.title
from titles as T join sales as SA on T.title_id = SA.title_id
	join stores as ST on SA.stor_id = ST.stor_id
where ST.stor_name = 'Bookbeat';

--k)
SELECT authors.au_fname, authors.au_lname
FROM titleauthor JOIN titles ON titleauthor.title_id=titles.title_id JOIN authors ON titleauthor.au_id=authors.au_id
GROUP BY authors.au_fname, authors.au_lname
HAVING count([type])>1;

--l)
SELECT T.[type], P.pub_id, avg(price) as avg_price, sum(S.qty) as total_sales
FROM titles as T JOIN publishers as P ON T.pub_id=P.pub_id JOIN sales as S on T.title_id = S.title_id
GROUP BY T.[type], P.pub_id;

--m)
SELECT titles.title, titles.advance, average_advance
FROM titles JOIN (SELECT titles.[type], avg(advance) as average_advance
					FROM titles
					GROUP BY [type]) as Av
				ON titles.[type]=av.[type]
WHERE titles.advance > AV.average_advance * 1.5;

--n)
select T.title, A.au_fname, A.au_lname, T.ytd_sales * T.royalty / 100 * TA.royaltyper / 100 as earnings
from titles as T join titleauthor as TA on T.title_id = TA.title_id
	join authors as A on TA.au_id = A.au_id
	join sales as S on T.title_id = S.title_id
group by T.title, A.au_fname, A.au_lname, T.ytd_sales, T.royalty, TA.royaltyper;

--o)
SELECT ytd_sales, title, price*ytd_sales as facturacao, royalty*0.01*price*ytd_sales as authors_money, price*ytd_sales-royalty*0.01*price*ytd_sales as publisher_money
FROM titles;

--p)
SELECT ytd_sales, title, au_lname, au_fname, price*ytd_sales as facturacao, royalty*0.01*price*ytd_sales*royaltyper*0.1 as authors_money, price*ytd_sales-royalty*0.01*price*ytd_sales as publisher_money
FROM titles AS T JOIN titleauthor as TA ON T.title_id=TA.title_id
	JOIN authors ON TA.au_id=authors.au_id;

-- q)
SELECT ST.stor_id, count(T.title_id) as number_titles
FROM stores as ST JOIN sales as SA ON ST.stor_id=SA.stor_id JOIN titles as T ON SA.title_id=T.title_id
GROUP BY ST.stor_id
HAVING count(T.title_id)=(SELECT count(*) FROM titles);

--r)
SELECT stor_name, sum(qty) as Qty_Sales
FROM stores AS STO JOIN sales AS SAL ON STO.stor_id=SAL.stor_id
GROUP BY stor_name
HAVING sum(qty)> (
	SELECT avg(Qty_Sales) as avg_store_sales
	FROM(
		SELECT stor_name, sum(qty) as Qty_Sales
		FROM stores AS STO JOIN sales AS SAL ON STO.stor_id=SAL.stor_id
		GROUP BY stor_name
		) as S
);


--s)
select title_id
from titles
where title_id not in
	(select SA.title_id
	from stores as ST join sales as SA on ST.stor_id = SA.stor_id
	where ST.stor_name = 'Bookbeat')

--t)

SELECT P.pub_name, St.stor_id
FROM stores AS st, publishers As P
EXCEPT
SELECT P.pub_name, St.stor_id
FROM stores AS St LEFT OUTER JOIN sales AS Sa ON St.stor_id=Sa.stor_id JOIN titles AS Ti ON Sa.title_id=Ti.title_id RIGHT OUTER JOIN publishers AS P ON Ti.pub_id=P.pub_id
GROUP BY P.pub_name, St.stor_id;

