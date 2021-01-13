# WGF Documentation

## WGF Getting started
- Install NPM packages
- `nvm use`
- `make start-postgre`
- `make db-migrate`
- `npm run dev`

## What we add

We add some technical stuff:
- nvmrc
- editorconfig
- docker-compose file to start DB easily
- a makefile to start docker and launch migration

Now we can track organization ID, event ID, tournament ID, post ID and website ID. To execute this, here the actual changes:
- migration has evolved, an update schema has been created in sql folder
- tracker can handle `data-metadata-website-id`
- tracker can handle `data-metadata-organization-id`
- tracker can handle `data-metadata-event-id`
- tracker trackView handler now support a new argument named `metadata`
- collect API endpoint manage metadata and pass it to pageView lib (not event at this time)

## How to basicly use with added metadata

Copy code from the umami interface in website settings panel and add this data attributes (no one is mendatory) and replace `[UUID]` by your IDs
```html
<script ... data-metadata-website-id="[UUID]" data-metadata-organization-id="[UUID]" data-metadata-event-id="[UUID]></script>
```

## How to use with react router

### 1. Deactivate auto track

To deactivate auto track add data attribute on the tracker script

```html
<script async defer ... data-auto-track="false"></script>
```

### 2. Manualy manage tracking in your views

Use umami from window object and use trackView handler in your connected components. The best solution is to create a hook to only pass metadata.

```js
const {
  umami,
} = window || {}

if (umami) {
  const metadata = {
    metadata_website_id: 'UUID', // Override the data attribute data-metadata-website-id, not recomanded
    metadata_organization_id: 'UUID', // Override the data attribute data-metadata-organization-id, not recomanded
    metadata_event_id: 'UUID',
    metadata_post_id: 'UUID',
    metadata_tournament_id: 'UUID',
  }

  /**
   * @params location: use react router dom location hook to retrieve
   * @params referrer: the previous location
   * @params umamiWebsiteId: set it has undefined the script already has this information from these data-attributes
   * @params metadata: see example above
   */
  umami.trackView(location, referrer, umamiWebsiteId, metadata)
}
```
