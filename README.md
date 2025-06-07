# Box Office Mojo API

This project exposes a simple REST API backed by Django and uses Riot.js with D3 to visualize box office results. It began as a small experiment to chart Nicolas Cage's film career but can be used for other actors as well.

## Features
- Django REST Framework based API for actors and movies
- Scrapes data from [Box Office Mojo](http://www.boxofficemojo.com/) using BeautifulSoup
- Example Riot.js tag demonstrating a D3 scatter plot

## Quick Start
1. Install dependencies with `pip install -r requirements.txt`
2. Run the development server:
   ```bash
   python mojo/manage.py migrate
   python mojo/manage.py runserver
   ```
3. Visit `http://localhost:8000` and navigate to `/movies/<actor-slug>/` to fetch movie data for an actor.

## Example D3 Scatter Plot
The project contains a Riot.js tag that renders a D3 scatter plot of lifetime gross vs. release date. A shortened version of that tag is shown below:

```javascript
svg = d3.select('svg');

xScale = d3.scale.linear()
  .domain([0, salesMax])
  .range([xAxisPadding, w - xAxisPadding]);

yAxis = d3.svg.axis()
  .scale(timeScale)
  .orient('left');

d3.select('#d3-div').append('svg')
  .attr('height', h)
  .attr('width', w);
```

## Scraping Helper
Movies are retrieved via the helper below which pulls table data from Box Office Mojo:
```python
from bs4 import BeautifulSoup
import requests

def get_movies(url):
    page = requests.get(url)
    soup = BeautifulSoup(page.text, 'html.parser')
    # ... parse the table ...
    return results
```

This repository is a snapshot of an experiment and is not actively maintained. It should still serve as a useful example of mixing Django, a small scraping script and a bit of D3.
