+++
title = "Datenschutz"
description = "Wie Panoptikum.social Ihre Daten verarbeitet."
menu = "footer"
weight = 50
+++

## Datenschutzerklärung

Wir verarbeiten Ihre Daten ausschließlich auf Grundlage der gesetzlichen Bestimmungen (DSGVO, TKG 2003). In dieser
Datenschutzerklärung informieren wir Sie über die wichtigsten Aspekte der Datenverarbeitung auf unserer Website.

Panoptikum.social speichert so viele Daten über Sie wie nötig und so wenige wie möglich.
Alle erhobenen Daten sind für das Angebot des Dienstes erforderlich. Panoptikum.social möchte weder
demografische Daten sammeln noch einzelne Personen identifizieren.

## Kommunikation mit uns

Wenn Sie uns eine E-Mail schicken, speichern wir Ihre Daten, um Ihre Anfrage bearbeiten zu können,
und für den Fall von Rückfragen sechs Monate lang. Diese Daten geben wir an niemanden weiter.

## Protokollierung

Wir protokollieren die Anfragen an unseren Webserver eine Woche lang, um Fehler in unserer Anwendung
und Server-Infrastruktur beheben zu können.
Diese Protokolle enthalten folgende Daten:

* User-Agent: also Browsertyp, Browserversion und Betriebssystem, wie sie Ihr Browser übermittelt
* Referrer-URL, also auf welcher Seite sich der Link befand, der Sie zu uns geführt hat
* IP-Adresse
* Datum und Uhrzeit

Außerdem protokollieren wir Ihre Anfragen auf dem Anwendungsserver eine Stunde lang, ausschließlich zur Fehlersuche.
Diese Protokolle enthalten keine IP-Adressen, nur Zeitstempel und den Pfad der Anfrage.

Panoptikum verwendet keinen Webanalyse-Dienst und kein Content Delivery Network.
Es werden keine Daten an Dritte übermittelt.

## Cookies

Diese Dokumentations-Website blog.panoptikum.social verwendet keine Cookies.

Panoptikum verwendet ein Cookie, um Ihre Sitzung zu erkennen. Es heißt `_pan_key` und ist signiert,
damit es nicht manipuliert werden kann. Es enthält die Sitzung, vor allem ein CSRF-Token und, wenn Sie
angemeldet sind, Ihre `user_id`, damit wir prüfen können, dass die Daten von Ihnen und nur von Ihrem
Browser kommen.

Sitzungen werden nicht auf dem Server gespeichert. Wenn Sie das Cookie in Ihrem Browser löschen,
sind also alle Angaben zu Ihrer Sitzung weg, und Sie müssen sich neu anmelden.

Wenn Sie beim Anmelden „30 Tage angemeldet bleiben“ ankreuzen, wird ein weiteres Cookie gesetzt. Es
heißt `_pan_remember_me`, ist wie das Sitzungs-Cookie signiert, enthält nur Ihre `user_id` und läuft
nach 30 Tagen ab. Damit bleiben Sie angemeldet, auch wenn Sie Ihren Browser schließen. Sie können es
jederzeit entfernen, indem Sie sich abmelden oder das Cookie in Ihrem Browser löschen. Wenn Sie das
Kästchen nicht ankreuzen, wird dieses Cookie nicht gesetzt.

Wenn Sie die Sprache von Panoptikum umschalten, wird ein Cookie namens `locale` gesetzt. Es enthält
nur die gewählte Sprache (`en` oder `de`) und läuft nach einem Jahr ab. Sind Sie angemeldet, wird die
gewählte Sprache zusätzlich in Ihrem Konto gespeichert.

Ein weiteres Cookie setzt der Podlove Web Player auf der Seite einer Episode, um sich die
Abspielposition zu merken, falls Sie das Hören unterbrechen, die Seite verlassen und später
zurückkommen. Dieses Cookie wird vom Server nicht verarbeitet.

## Tokens

Der Zugriff über die API läuft nicht über Cookies, sondern über signierte Tokens, die nur Ihre
`user_id` enthalten. Diese Tokens sind eine Stunde gültig.

Die Links in den E-Mails, die wir Ihnen schicken (Bestätigung der E-Mail-Adresse, Login-Link bei
vergessenem Passwort), enthalten ein signiertes Token derselben Art. Es ist eine Stunde gültig, nur
der Login-Link in der Benachrichtigung vor dem Löschen eines Kontos (siehe Speicherdauer) ist 30 Tage
gültig. Wer den Link hat, kann sich in dieser Zeit als Sie anmelden, leiten Sie diese E-Mails daher
bitte nicht weiter.

## Registrierung

Bei der Registrierung werden Sie nach einer E-Mail-Adresse (nötig zur Bestätigung Ihres Kontos und
zur Wiederherstellung des Passworts), einem Benutzernamen (für Ihre Bewertungen, Kommentare und Likes)
und einem Passwort (für die Anmeldung) gefragt. Sie können jeden Benutzernamen wählen, der in
Panoptikum noch nicht vergeben ist.

## Bestätigung der E-Mail-Adresse

Nach der Registrierung schicken wir Ihnen eine E-Mail mit einem Bestätigungslink. Bevor Sie diesem
Link gefolgt sind, können Sie sich nicht anmelden. Wenn die E-Mail nicht ankommt oder der Link
abgelaufen ist, geben Sie auf der Anmeldeseite Ihren Benutzernamen und Ihr Passwort ein: Dann wird
Ihnen angeboten, die E-Mail erneut zu schicken. Auch der Login-Link, den wir Ihnen bei vergessenem
Passwort schicken, bestätigt Ihre E-Mail-Adresse.

## E-Mails, die wir verschicken

Wir verschicken nur E-Mails, die für den Betrieb des Dienstes nötig sind: die Bestätigungs-E-Mail,
den Login-Link bei vergessenem Passwort, Anfragen zur Übernahme einer Persona und die Benachrichtigung
vor dem Löschen eines Kontos (siehe Speicherdauer). Wir verschicken keine Newsletter und keine Werbung.

Kann eine E-Mail nicht zugestellt werden, etwa weil die Adresse nicht existiert, schickt unser
Mailserver einen Zustellbericht an ein Postfach von uns. Er enthält die ursprüngliche Nachricht.
Außerdem vermerken wir Empfängeradresse und Betreff solcher Fehler in einem internen Protokoll, um
Probleme finden zu können. Beides ist nur für den Betreiber von Panoptikum zugänglich.

## Erhobene Daten

Neben den Angaben bei der Registrierung verwendet Panoptikum.social Ihre hochgeladene
Abonnementliste (OPML-Datei), um Podcasts in die Podcast-Liste von Panoptikum.social aufzunehmen. Es
speichert und veröffentlicht, dass Sie den Podcast abonniert haben. Panoptikum.social speichert und
veröffentlicht Ihre Bewertungen, Kommentare und Likes.

Panoptikum speichert außerdem das Datum Ihrer letzten Anmeldung. Damit werden Konten gefunden, die
nicht mehr benutzt werden (siehe Speicherdauer).

## Speicherdauer

* Konten, deren E-Mail-Adresse nicht bestätigt wurde, und Konten, mit denen sich zwei Jahre lang
  niemand angemeldet hat, werden per E-Mail benachrichtigt. Die E-Mail enthält einen Login-Link, der
  Ihre E-Mail-Adresse bestätigt. Wenn Sie sich nicht innerhalb von 30 Tagen nach dieser E-Mail
  anmelden, wird das Konto gelöscht. Eine Anmeldung zu jedem beliebigen Zeitpunkt erhält das Konto.
* Sie können Ihr Konto und jeden Teil Ihrer Daten jederzeit selbst löschen, siehe unten.

Wird ein Konto gelöscht, werden damit auch Ihre Registrierungsdaten, Ihre Abonnements und
OPML-Uploads, die Podcasts, Personas, Kategorien und Benutzer:innen, denen Sie folgen, Ihre Likes und
Empfehlungen sowie Ihre Übernahmen von Personas gelöscht. Personas selbst sind öffentliche Profile,
die aus Podcast-Feeds stammen, und gehören nicht zu Ihrem Konto: Sie bleiben bestehen, auch mit einer
E-Mail-Adresse, die bei einer Persona gespeichert wurde. Rechnungen aus dem früheren kostenpflichtigen
Angebot werden aufbewahrt, aber ohne Verbindung zu Ihrem Konto.

## Selbstauskunft

Es gibt eine Selbstauskunft über Ihre Daten. Registrierte Benutzer:innen können ihre bei Panoptikum
gespeicherten Daten nach der Anmeldung über die Funktion „Meine Daten“ verwalten.
„Meine Daten“ öffnet die Seite „Konto“, bietet alle Ihre Daten mit einem Button zum Herunterladen als
JSON-Datei an und zeigt Ihnen alle gespeicherten Daten. Sie können prüfen, was in den einzelnen
Bereichen gespeichert ist, und es pro Bereich löschen. Im Bereich selbst können Sie entweder alle
Einträge oder einzelne Einträge löschen. Mehr dazu finden Sie im
[Handbuch für Hörer:innen](/manuals/listener-manual).

## Ihre Rechte

Ihnen stehen grundsätzlich die Rechte auf Auskunft, Berichtigung, Löschung, Einschränkung,
Datenübertragbarkeit, Widerruf und Widerspruch zu. Wenn Sie glauben, dass die Verarbeitung Ihrer
Daten gegen das Datenschutzrecht verstößt oder Ihre datenschutzrechtlichen Ansprüche sonst in einer
Weise verletzt worden sind, können Sie sich bei der Aufsichtsbehörde beschweren. In Österreich ist
das die [Datenschutzbehörde](https://www.dsb.gv.at/).

## Kontakt

Sie erreichen uns unter:

Mag. Stefan Haslinger  
Vorgartenstraße 145/2/3  
1020 Wien, Österreich  

:icon-phone: +43 680 213 3030

:icon-mail: <stefan@panoptikum.social>
