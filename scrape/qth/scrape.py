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
    print("Scraping page", end="", flush=True)
    while True:
        print(" %d " % page, end="", flush=True)
        r = requests.get(url + str(startnum))
        s = BeautifulSoup(r.content, "html.parser")
        dl = s.find("dl")
        dts = dl.find_all("dt")
        if not dts:
            break
        for dt in dts:
            f.write(dt.text + "\n")
        # each page contains ten results
        startnum += 10
        page += 1
        time.sleep(3)
    print()
    f.close()
