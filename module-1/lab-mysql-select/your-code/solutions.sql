SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors
INNER JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
JOIN titles
	ON titles.title_id = titleauthor.title_id
JOIN publishers
	ON publishers.pub_id = titles.pub_id
order by au_id;

SET sql_mode = '';
SELECT COUNT(*) FROM titleauthor;

