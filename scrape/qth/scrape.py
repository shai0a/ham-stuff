import re
import time
import datetime
import requests
from bs4 import BeautifulSoup

url = "https://swap.qth.com/search-results.php?fieldtosearch=DatePlaced&keywords="
today = datetime.datetime.now().strftime("%x")
url += today + "&startnum="
page = 1
startnum = 0

with open(r"qth_%s.txt" % today.replace("/", "."), "w") as f:
    while True:
        r = requests.get(url + str(startnum))
        s = BeautifulSoup(r.content, "html.parser")
        print(s.find(string=re.compile("ads matching your search for")).replace("Displaying", "Scraping"), end="")
        dl = s.find("dl")
        dts = dl.find_all("dt")
        if not dts:
            break
        f.write(dts[0].text + "\n")
        # each page contains ten results
        startnum += 10
        page += 1
    f.close()
