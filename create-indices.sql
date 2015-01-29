SELECT AddGeometryColumn ('public', 'osm_waterareas', 'point', 900913, 'POINT', 2, false);
update osm_waterareas set point = ST_PointOnSurface(geometry);

CREATE INDEX osm_landusages_type_idx ON osm_landusages(type);
CREATE INDEX osm_waterareas_area_idx ON osm_waterareas(area);
CREATE INDEX osm_waterways_type_idx ON osm_waterways(type);
CREATE INDEX osm_admin_admin_level_idx ON osm_admin(admin_level);
CREATE INDEX osm_places_type_idx ON osm_places(type);
CREATE INDEX osm_places_population_idx ON osm_places(population);
CREATE INDEX osm_amenities_type_idx ON osm_amenities(type);

CREATE INDEX osm_motorways_type_idx ON osm_motorways(type);
CREATE INDEX osm_mainroads_type_idx ON osm_mainroads(type);
CREATE INDEX osm_minorroads_type_idx ON osm_minorroads(type);
CREATE INDEX osm_railways_type_idx ON osm_railways(type);
CREATE INDEX osm_motorways_bridge_idx ON osm_motorways(bridge);
CREATE INDEX osm_mainroads_bridge_idx ON osm_mainroads(bridge);
CREATE INDEX osm_minorroads_bridge_idx ON osm_minorroads(bridge);
CREATE INDEX osm_railways_bridge_idx ON osm_railways(bridge);
CREATE INDEX osm_motorways_tunnel_idx ON osm_motorways(tunnel);
CREATE INDEX osm_mainroads_tunnel_idx ON osm_mainroads(tunnel);
CREATE INDEX osm_minorroads_tunnel_idx ON osm_minorroads(tunnel);
CREATE INDEX osm_railways_tunnel_idx ON osm_railways(tunnel);
