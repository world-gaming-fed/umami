ALTER TABLE pageview ADD metadata_website_id VARCHAR(255);
ALTER TABLE pageview ADD metadata_organization_id VARCHAR(255);
ALTER TABLE pageview ADD metadata_tournament_id VARCHAR(255);
ALTER TABLE pageview ADD metadata_post_id VARCHAR(255);
ALTER TABLE pageview ADD metadata_event_id VARCHAR(255);

CREATE INDEX pageview_metadata_website_id_idx ON pageview(metadata_website_id);
CREATE INDEX pageview_metadata_organization_id_idx ON pageview(metadata_organization_id);
CREATE INDEX pageview_metadata_tournament_id_idx ON pageview(metadata_tournament_id);
CREATE INDEX pageview_metadata_post_id_idx ON pageview(metadata_post_id);
CREATE INDEX pageview_metadata_event_id_idx ON pageview(metadata_event_id);
