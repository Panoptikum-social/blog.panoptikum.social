+++
title = "Privacy"
description = "How Panoptikum.social processes your data."
menu = "footer"
weight = 50
+++

## Privacy Policy

We process your data only according to law regulations (DSGVO, TKG2003). In this privacy policy we
inform you about the most important aspects of data processing within our website.

Panoptikum.social tries to store as much data as necessary and as little data as possible about you.
All the data collected is required to offer the service. Panoptikum.social does not intend to collect
demographic data or to identify single persons.

## Communication with Us

If you send us an email, we store your data to be able to handle your request
and for the case of follow up questions for six months. This data we do not
share with anybody else.

## Logging

We are logging the requests to our web server for one week to be able to fix errors of our application
and server infrastructure.
These contain the following data:

* User-Agent: i.e. browser type, browser version and operation system as sent
  by your browser
* Referrer URL, i.e. on which site was the link located, that did bring you to
  our site
* IP address
* Time and Date

We are also logging your requests on the application server for one hour for sole debugging reasons.
These requests do not contain IP Addresses, just time stamps and the request path.

Panoptikum does not use a web analytics service or a content delivery service.
No data is transferred to any third parties.

## Cookies

This documentation website blog.panoptikum.social uses no cookies

Panoptikum uses a cookie to identify your session. It is called `_pan_key` and signed to be prevented
from tampering. It contains the session, mostly a CSRF token and your `user_id`, in case you are
logged in to be able to check, that you and only your browser sent the data.

Sessions are not stored on the server, so by deleting the cookie in your browser,
all facts about your session are gone and you will have to login again.

If you tick "Remember me for 30 days" when you log in, an additional cookie is set. It is called
`_pan_remember_me`, is signed like the session cookie, contains only your `user_id` and expires
after 30 days. It keeps you logged in after you have closed your browser. You can remove it at any
time by logging out or by deleting the cookie in your browser. If you do not tick the box, this
cookie is not set.

Another cookie is set by the Podlove Webplayer on the episode show page to remember the play
position in case you stop listening, leave the page and come back later. This cookie is not
processed by the server.

## Tokens

API access is not handled via cookies, but with signed tokens, which only contain your `user_id`.
These tokens are valid for one hour.

The links in the emails we send you (email verification, login link for a forgotten password) contain
a signed token of the same kind. It is valid for one hour, only the login link in the notice before
an account is deleted (see Storage Periods) is valid for 30 days. Whoever has the link can log in as
you during that time, so please do not forward these emails.

## Registration

During the registration you will be asked for an email address (required to verify your account and
for password recovery), an user name (used for your reviews, comments and likes) and a password (for login). You can choose
any user name as long as it has not been taken yet within Panoptikum.

## Email Verification

After the registration we send you an email with a verification link. Until you have followed this
link, you cannot log in. If the email does not arrive or the link has expired, enter your username and
password on the login page: you will be offered to have the email sent again. Following the login link
we send you after a forgotten password verifies your email address as well.

## Emails We Send

We send only the emails that are necessary to run the service: the verification email, the login link
after a forgotten password, requests concerning the claiming of a persona, and the notice before an
account is deleted (see Storage Periods). We send no newsletters and no advertising.

If an email cannot be delivered, for example because the address does not exist, our mail server
returns a delivery report to a mailbox of ours. It contains the original message. We also note the
recipient address and the subject of such failures in an internal log to be able to find problems.
Both are only accessible to the operator of Panoptikum.

## Collected Data

Beside the information provided during registration, Panoptikum.social uses your uploaded subscription
list (OPML file) to add podcasts to the Panoptikum.social podcast list. It stores and publishes that
you are a subscriber of the podcast. Panoptikum.social stores and publishes your reviews, comments and
likes.

Panoptikum also stores the date of your last login. It is used to find accounts that are not used
any more (see Storage Periods).

## Storage Periods

* Accounts whose email address has not been verified and accounts that have not been used to log in
  for two years are announced by email. The email contains a login link that verifies your email
  address. If you do not log in within 30 days after this email, the account is deleted. Logging in
  at any time keeps the account.
* You can delete your account and any part of your data yourself at any time, see below.

When an account is deleted, your registration data, your subscriptions and OPML uploads, your follows,
likes and recommendations and your claims of personas are deleted with it. Personas themselves are
public profiles derived from podcast feeds and are not part of your account: they stay, including an
email address that has been stored with a persona. Invoices of the former paid plan are kept, without
a connection to your account any more.

## Data access self service

A data access self service is implemented. Registered users can manage their
data stored at Panoptikum after the log in with the function My Data.
My Data opens the page Account and offers all your data as a JSON-File with a
Download button and shows you all your stored data. You can check what is stored
the different areas and delete it per area. In the area itself you can either
delete all entries or just individual entries. You find more information in the
[Listener Manual](/manuals/listener-manual).

## Your Rights

You have the right of information, correction, deletion, restriction,
transfer, cancellation and protest on principle. If you believe, that the
processing of your data does not adhere to data privacy laws or your
privacy demands are refused in any kind, you can complain at the local
controlling institution. In Austria, this is
[Datenschutzbehörde](https://www.dsb.gv.at/).

## Contact

You can contact us via:

Mag Stefan Haslinger  
Vorgartenstrasse 145/2/3  
1020 Wien, Austria  

:icon-phone: +43 680 213 3030

:icon-mail: <stefan@panoptikum.social>
