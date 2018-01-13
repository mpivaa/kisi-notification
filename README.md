# Getting Started

Install dependencies
```sh
bundle
```

Configure environment variables in `.env` file
```sh
cp .env.sample .env
```

For testing purposes, this config can be used
```sh
FROM_EMAIL='notification@getkisi.com'
SMTP_USERNAME='app85492888@heroku.com'
SMTP_PASSWORD='vimi1cfd5142'
```

Run the app
```sh
ruby app/app.rb
```

The app accepts POST requests in `/events` path,
following the schema defined in the [docs](https://kisiapi.docs.apiary.io/#introduction/integrations/webhooks), except the `actor_email` field that I couldn't find.

## Testing

```sh
rake
```
