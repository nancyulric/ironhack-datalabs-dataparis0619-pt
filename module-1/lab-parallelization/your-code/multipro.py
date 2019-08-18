#!/usr/bin/env python
# coding: utf-8

# # Parallelization Lab
# 
# In this lab, you will be leveraging several concepts you have learned to obtain a list of links from a web page and crawl and index the pages referenced by those links - both sequentially and in parallel. Follow the steps below to complete the lab.

# ## Step 1: Use the requests library to retrieve the content from the URL below.

# In[58]:


import requests

url = 'https://en.wikipedia.org/wiki/Data_science'


# In[59]:


r = requests.get(url)
print(r.content)


# ## Step 2: Use BeautifulSoup to extract a list of all the unique links on the page.

# In[60]:


from bs4 import BeautifulSoup


# In[61]:


soup = BeautifulSoup(r.text)
liens = soup.find_all("a")[1:]
liste_liens = []
for elements in liens:
    liste_liens.append(elements.get("href"))
#liste_liens


# ## Step 3: Use list comprehensions with conditions to clean the link list.
# 
# There are two types of links, absolute and relative. Absolute links have the full URL and begin with http while relative links begin with a forward slash (/) and point to an internal page within the wikipedia.org domain. Clean the respective types of URLs as follows.
# 
# - Absolute Links: Create a list of these and remove any that contain a percentage sign (%).
# - Relativel Links: Create a list of these, add the domain to the link so that you have the full URL, and remove any that contain a percentage sign (%).
# - Combine the list of absolute and relative links and ensure there are no duplicates.

# In[62]:


domain = 'http://wikipedia.org'


# In[64]:


liens_propres = []
for x in liste_liens:
    if x.startswith('/') and '%' not in x:
        liens_propres.append(domain+ x)
    if x.startswith('http') and '%' not in x:
            liens_propres.append(x)
    
liens_propres= set(liens_propres)
len(liens_propres)
liens_propres


# ## Step 4: Use the os library to create a folder called *wikipedia* and make that the current working directory.

# In[79]:


import os


# In[80]:



os.mkdir('Wikipedia')


# ## Step 5: Write a function called index_page that accepts a link and does the following.
# 
# - Tries to request the content of the page referenced by that link.
# - Slugifies the filename using the `slugify` function from the [python-slugify](https://pypi.org/project/python-slugify/) library and adds a .html file extension.
#     - If you don't already have the python-slugify library installed, you can pip install it as follows: `$ pip install python-slugify`.
#     - To import the slugify function, you would do the following: `from slugify import slugify`.
#     - You can then slugify a link as follows `slugify(link)`.
# - Creates a file in the wikipedia folder using the slugified filename and writes the contents of the page to the file.
# - If an exception occurs during the process above, just `pass`.

# In[53]:


get_ipython().system('pip install python-slugify')


# In[86]:


from slugify import slugify

def index_page(link):
    filename = slugify(link)
    f = open(filename, 'wb')
    response = requests.get(link).content
    f.write(response)


# ## Step 6: Sequentially loop through the list of links, running the index_page function each time.
# 
# Remember to include `%%time` at the beginning of the cell so that it measures the time it takes for the cell to run.

# In[87]:


get_ipython().run_cell_magic('time', '', 'for link in liens_propres:\n   index_page(link)')


# ## Step 7: Perform the page indexing in parallel and note the difference in performance.
# 
# Remember to include `%%time` at the beginning of the cell so that it measures the time it takes for the cell to run.

# In[88]:


import multiprocessing


# In[ ]:


get_ipython().run_cell_magic('time', '', 'pool = multiprocessing.Pool()\nresult = pool.map(index_page,liens_propres)\npool.terminate()\npool.join()\nflatten = [file for sublist in result for file in sublist]')


# In[ ]:




