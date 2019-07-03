SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
JOIN titles
	ON titles.title_id = titleauthor.title_id
JOIN publishers
	ON publishers.pub_id = titles.pub_id
order by au_id;

SELECT COUNT(*) FROM titleauthor;

SET sql_mode = '';

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(titles.title)
FROM authors
JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
JOIN titles
	ON titles.title_id = titleauthor.title_id
JOIN publishers
	ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name
order by au_id DESC;

SET sql_mode = '';

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(titles.ytd_sales) AS `somme`
FROM authors
/*JOIN titles
	ON titles.title_id= authors.au_id*/
JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
JOIN titles
	ON titleauthor.title_id = titles.title_id
GROUP BY titleauthor.au_id
ORDER BY `somme` DESC
LIMIT 3;

SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(titles.ytd_sales) AS `somme`
FROM authors
LEFT JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id
GROUP BY titleauthor.au_id
ORDER BY `somme` DESC;

