---
title: API
layout: without_sidebar
permalink: api/
navigation: 2
---

# API

The API adheres to [json:api](http://jsonapi.org) standards. exAll endpoints are available without throttling.

## Get public data

Prepend all requests with `https://panoptikum.io/jsonapi`.

All instances in "relationships" can be found with a link and a minimal set of attributes in "included".
You can basically explore the whole API world of Panoptikum by starting at /categories and following
links from there recursively.

path | method | purpose | included
--- | --- | ---
`/categories` | GET | tree of categories | children = subcategories
`/categories/:id` | GET | single category | children, (paginated) podcasts, parent ; podcasts ordered by last episode publishing date descending nulls last
`/podcasts` | GET | list of podcast, paginated, ordered by insertion date descending | categories, languages, engagements & contributors (= personas)
`/podcasts/:id` | GET | single podcast | (paginated) episodes, subscription_count, engagements, recommendations, categories, contributors (= personas, follower_count, likes_count, languages, feeds
`/podcasts/most_liked` | GET | 10 most liked podcasts ordered by like count descending | -
`/podcasts/most_subscribed` | GET | 10 most subscribed podcasts ordered by subscription count descending | -
`/podcasts/last_updated` | GET | last updated podcasts | paginated
`/languages` | GET | list of languages | -
`/languages/:id` | GET | single language | -
`/engagements/:id` | GET | engagement | persona, podcast
`/personas/` | GET | list of personas | redirect
`/personas/:id` | GET | single persona | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/users/` | GET | list of users | -
`/users/:id` | GET | single user | users_i_like, categories_i_like, depending on preferences: podcasts_i_subscribed, podcasts_i_follow
`/recommendations` | GET | list of recommendations, paginated, order by insertion date descending | episode, podcast, chapter, user
`/recommendations/:id` | GET | single recommendation | user-name, one of: podcast, episode, chapter |
`/recommendations/random` | GET | random recommendation | episode, podcast, category;<br/> the episode belongs to that podcast, the podcast belongs to that category
`/feeds/:id` | GET | single feed | podcast, alternate_feed
`/alternate_feeds/:id` | GET | single alternate feed | feed
`/episodes` | GET | list of episodes, paginated, ordered by publishing_date descending | podcast, gigs & contributors (= personas)
`/episodes/:id` | GET | single episode | podcast, chapters, enclosures, recommendations, gigs & contributors (= personas), like_count
`/chapters/:id` | GET | single chapter | episode, recommendations, like_count
`/enclosure/:id` | GET | single enclosure | episode
`/gigs/:id` | GET | single gig | persona, episode
`/subscription/:id` | GET | single subscription;<br/> only shown, when user shares | user, podcast
`/follow/:id` | GET | single follow;<br/> only shown, when user shares | category, follower, user, podcast, persona
`/like/:id` | GET | single like | category, enjoyer, user, podcast, chapter, persona, episode
{: .table .table-bordered}


### Pagination

Podcasts within a category, gigs for a persona and episodes for a podcast are paginated:

* Example request: `https://panoptikum.io/jsonapi/personas/1?page[number]=1&page[size]=10`
* page[number] ... page number; starts counting at 1, defaults to 1
* page[size] ... number of items per page, defaults to 10
* Links contain self, prev, next, last and first link (if appropriate).


### Full Text Search

path | method | purpose | included
--- | --- | ---
<nobr><code class="highlighter-rouge">/search?filter[:type]=:term</code></nobr> | GET | redirects to the appropriate route below | type can be either `persona`,`category`,`podcast` or `episode`
`/categories/search?filter=:term` | GET | searches for categories with `:term` | children = subcategories
`/podcasts/search?filter=:term` | GET | searches for podcasts with `:term` | categories, languages, engagements & contributors (= personas)
`/episodes/search?filter=:term` | GET | searches for episodes with `:term` | podcast, gigs & contributors (= personas)
`/personas/search?filter=:term` | GET | searches for personas with `:term` | redirect (= persona) , delegates (= personas), podcasts
{: .table .table-bordered}


## Login

To be able to post data and receive your own private data, it's necessary to post a token along
side. To get a token, post username and password to recieve a token back, that's valid for one hour.
The token will also be provided in the header `token`.

Typically, you would call something a login, though it's only getting you a new token,
we provide both routes as endpoints, take the one with the name you prefer.
There is no session or cookie connected to that, so there is also no logout.

path | method | params | purpose | included
`/login` or `/get_token` | POST | `username`, `password` | get a token | token including validity data and user id
{: .table .table-bordered}

One user can access the application via the api from different devices simuntaneously. They are not
device specific.

Only users with confirmed email address can aquire tokens. Please make sure, that you click the email
confirmation link in the email that is sent to you after login via the web interface. There will
be an approriate error message telling you to do so, if you request a token and your email is not
confirmed yet.

#### *Example:* Get a token

If working with tokens is something new for you, an example might help to set the expectations right.

Request:

`curl --data "username=janedoe&password=secret" http://localhost:4000/jsonapi/login`

Response:
```
{"jsonapi":
  {"version":"1.0"},
  "data":{"type":"session-api",
          "id":"6",
          "attributes":{"valid-until":"2017-09-08T16:46:08.393642Z",
                        "valid-for":"1 hour",
                        "token":"SFMyNTY.g3QAAAACdwRk....yNXj3wvSs9a9Ps5wO6yrY",
                        "created-at":"2017-09-08T15:46:08.393630Z"}}}
```

### *A note on security*

You get the token in a transport encrypted response via https. If you disclose the token, you
basically disclose your password. This is the case because the token owner can change the password
within the next hour, no matter if you recreated another token. So don't store it unencrypted.

## Post data and get private data

For all these end points it is necessary to provide a valid token. Unless you do so,
you will receive appropriate feedback, if the token is invalid, out of date or has not been
provided at all.

The token has to be provided as "Authentication: Bearer :token" header, where you exchange the
variable :token with the token, that you aquired before as described above.

Why didn'd we choose to support a token provided as a parameter, you might ask? We don't want to log
tokens, which we would have done for get requests.

Requests are done with or for the user identified by the token.

path | method | params | purpose | included
/pan/likes/toggle | POST | `category_id` or `podcast_id` or `episode_id` or `chapter_id` or `user_id` or `persona_id` | like or unlike a category, podcast, episode, chapter, user or persona | <nobr><code class="highlighter-rouge">deleted</code>: true / false</nobr> <br/> `created`: true / false
/pan/follows/toggle | POST | `category_id` or `podcast_id` or `user_id` or `persona_id` | follow or unfollow a category, podcast, user or persona | `deleted`: true / false <br/> `created`: true / false
/pan/subscriptions/toggle | POST | `podcast_id` | follow or unfollow a podcast | `deleted`: true / false <br/> `created`: true / false
{: .table .table-bordered}

#### *Example:* Like a podcast

Here is an example how you would like (or unlike, it you liked it before) a podcast.

Request:

`curl --data "username=informatom&password=secret" http://localhost:4000/jsonapi/login`

Pick up the token from the response and provide it in the next request as a header.

Request:

`curl --data "podcast_id=104" -H "Authorization: Bearer SFMyNTY.g3QAAAACdwRk....yNXj3wvSs9a9Ps5wO6yrY" http://localhost:4000/jsonapi/pan/likes/toggle`

---

Further endpoints are currently under development.