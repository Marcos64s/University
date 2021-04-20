use pubs;

-- a)
go
CREATE VIEW title_author AS
SELECT titles.title, authors.au_fname, authors.au_lname
FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON titleauthor.au_id=authors.au_id;

-- b)
go
CREATE VIEW publisher_employee AS
SELECT pub_name, fname, lname
FROM employee JOIN publishers ON employee.pub_id=publishers.pub_id;

-- c)
go
CREATE VIEW stores_titles AS
SELECT stor_name, title
FROM stores JOIN sales ON stores.stor_id=sales.stor_id JOIN titles ON sales.title_id=titles.title_id;

-- d)
go
CREATE VIEW business_titles AS
SELECT title_id, title, type, pub_id, price, notes
FROM titles
WHERE titles.type='Business'
WITH CHECK OPTION;
go

--dá uma cena estranha 

-- 2)
SELECT title_author.title, au_fname, au_lname, stor_name
FROM title_author JOIN stores_titles ON title_author.title=stores_titles.title
	JOIN business_titles ON business_titles.title=stores_titles.title;

-- 3)
go
ALTER VIEW title_author AS
SELECT titles.title_id, titles.title, authors.au_fname, authors.au_lname
FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON titleauthor.au_id=authors.au_id;
go

ALTER VIEW stores_titles AS
SELECT stor_name, titles.title_id
FROM stores JOIN sales ON stores.stor_id=sales.stor_id JOIN titles ON sales.title_id=titles.title_id;

go

SELECT stor_name, au_fname, au_lname
FROM title_author JOIN stores_titles ON title_author.title_id=stores_titles.title_id
ORDER BY stor_name;