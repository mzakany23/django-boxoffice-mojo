from bs4 import BeautifulSoup
import requests

page1 = 'http://www.boxofficemojo.com/people/?view=Actor&pagenum=1&sort=person&order=ASC&p=.htm'
page2 = 'http://www.boxofficemojo.com/people/?view=Actor&pagenum=2&sort=person&order=ASC&p=.htm'
page3 = 'http://www.boxofficemojo.com/people/?view=Actor&pagenum=3&sort=person&order=ASC&p=.htm'

def get_names(page):
	page = requests.get(page)
	pages = [page1,page2,page3]

	soup = BeautifulSoup(page.text,'html.parser')
	header = ['# Movies / Average','#1 Picture','Gross','Person(Click to view)','Total Gross']
	count = 0
	name_list = []

	for tr in soup.findAll('table')[2].find('td'):
		for td in tr.findAll('td'):
			formatted_row = td.text
			if formatted_row not in header:
				# print count
				if count == 0:
					name_list.append(formatted_row)
				
				if count == 6:
					name_list.append(formatted_row)
					count = 0
				
				count += 1
				
	return name_list

def all_names():
	first_list = get_names(page1)
	second_list = get_names(page2)
	third_list = get_names(page3)
	mergedlist = []
	mergedlist.extend(first_list)
	mergedlist.extend(second_list)
	mergedlist.extend(third_list)

	return mergedlist

