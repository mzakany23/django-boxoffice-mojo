from bs4 import BeautifulSoup
import requests

def get_movies(url):
	page = requests.get(url)
	soup = BeautifulSoup(page.text,'html.parser')
	count = 0
	results = []
	inner = {
		'date' : None,
		'title' : None,
		'studio' : None,
		'lifetime_gross' : None,
		'lifetime_gross_theaters' : None,
		'opening' : None,
		'opening_theaters' : None,
		'rank' : None
	}

	header = ['Title (click to view)','Studio','Lifetime Gross / Theaters','Opening / Theaters','Rank','Date']
	
	for tr in soup.findAll('table')[1].find('td'):
		
		for td in tr.findAll('td'):
			formatted_row = td.text
			if formatted_row not in header:
				if count == 0:
					inner['date'] = formatted_row
				if count == 1:
					inner['title'] = formatted_row
				if count == 2:
					inner['studio'] = formatted_row
				if count == 3:
					inner['lifetime_gross'] = formatted_row.replace('$','').replace(',','')
				if count == 4:
					inner['lifetime_gross_theaters'] = formatted_row
				if count == 5:
					inner['opening'] = formatted_row
				if count == 6:
					inner['opening_theaters'] = formatted_row
				if count == 7:
					inner['rank'] = formatted_row
				if count == 8:	
					inner['date'] = formatted_row
					results.append(inner)

					inner = {
						'date' : None,
						'title' : None,
						'studio' : None,
						'lifetime_gross' : None,
						'lifetime_gross_theaters' : None,
						'opening' : None,
						'opening_theaters' : None,

					}
					count = 0
				count += 1
	return results

# url = 'http://www.boxofficemojo.com/people/chart/?id=wernerherzog.htm'

# print get_movies(url)

