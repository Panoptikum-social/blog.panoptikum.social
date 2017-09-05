---
title: API
layout: default
permalink: api/
---

# API

The API adheres to [json:api](http://jsonapi.org) standards.

## Endpoints

Currently all endpoints are available without authorization or throttling.

Prepend all requests with `https://panoptikum.io/jsonapi`.

All instances in "relationships" can be found with a link and a minimal set of attributes in "included".
You can basically explore the whole API world of Panoptikum by starting at /categories and following
links from there recursively.

path | method | purpose | included
--- | --- | ---
`/categories` | GET | tree of categories | children = subcategories
`/categories/:id` | GET | single category | children, (paginated) podcasts, parent
`/podcasts` | GET | list of podcast, paginated, ordered by insertion date descending | categories, languages, engagements & contributors (= personas)
`/podcasts/:id` | GET | single podcast | (paginated) episodes, subscription_count, engagements, recommendations, categories, contributors (= personas, follower_count, likes_count, languages, feeds
`/podcasts/last_updated` | GET | last updated podcasts | paginated
`/languages` | GET | list of languages | -
`/languages/:id` | GET | single language | -
`/engagements/:id` | GET | engagement | persona, podcast
`/personas/:id` | GET | single persona | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/recommendations/:id` | GET | single recommendation | user-name, one of: podcast, episode, chapter |
`/recommendations/random` | GET | random recommendation | episode, podcast, category;<br/> the episode belongs to that podcast, the podcast belongs to that category |
`/feeds/:id` | GET | single feed | podcast, alternate_feed
`/alternate_feeds/:id` | GET | single alternate feed | feed
`/episodes` | GET | list of episodes, paginated, ordered by publishing_date descending | podcast, gigs & contributors (= personas)
`/episodes/:id` | GET | single episode | podcast, chapters, enclosures, recommendations, gigs & contributors (= personas), like_count
`/chapters/:id` | GET | single chapter | episode, recommendations, like_count
`/enclosure/:id` | GET | single enclosure | episode
`/gigs/:id` | GET | single gig | persona, episode
{: .table .table-bordered}

### Pagination

Podcasts within a category, gigs for a persona and episodes for a podcast are paginated:

* Example request: `https://panoptikum.io/jsonapi/personas/1?page[number]=1&page[size]=10`
* page[number] ... page number; starts counting at 1, defaults to 1
* page[size] ... number of items per page, defaults to 10
* Links contain self, prev, next, last and first link (if appropriate).
