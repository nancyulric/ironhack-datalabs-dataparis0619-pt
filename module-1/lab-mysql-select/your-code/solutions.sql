SELECT authors.au_id, authors.au_lname, authors.au_lname, titles.title
FROM authors
INNER JOIN titleauthor
	ON titleauthor.au_id = authors.au_id
JOIN titles
	ON titles.title_id = titleauthor.title_id;
