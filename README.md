
CREATE RESERVATION:
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -XPOST 0.0.0.0:3000/reservations -d '{"restaurant_name":"Zomato","table":"table_1","shift":"morning","reservation_at":"2019-01-11T9:30:00","guest":"Puneet Gupta","guest_count":"2"}'

GET ALL RESERVATIONS:
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -XGET 0.0.0.0:3000/reservations -d '{"restaurant_name":"Zomato"}'

UPDATE RESERVATION (by passing reservation id):
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -XPUT 0.0.0.0:3000/reservations/5 -d '{"restaurant_name":"Zomato","table":"table_1","shift":"morning","reservation_at":"2019-01-11T9:00:00","guest":"Puneet Gupta","guest_count":"2"}'