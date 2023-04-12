#!/usr/bin/env python

import requests
from bs4 import BeautifulSoup

url = 'https://www.eham.net/classifieds'

r = requests.get(url)

s = BeautifulSoup(r.content, "html.parser")

for div in s.find_all('div', attrs={'class': 'nicebox'}):
    h3 = div.find('h3')
    if h3 is not None:
        a = h3.find('a')
        if a is not None:
            print('/'.join([url, a.get('href').split('/')[-1]]), a.get_text())
