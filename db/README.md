Here is draft code for dbdiagram:

Table Users {
  id int [pk, increment]
  name varchar
  nickname varchar
  email varchar [unique]
  phone varchar
  password varchar
}

Table Auction {
  id int [pk, increment]
  description varchar
  item_id int [ref: > Item.id]
  seller_id int [ref: > Users.id]
  start_time datetime
  end_time datetime
  starting_price decimal
  current_price decimal
}

Table Item {
  id int [pk, increment]
  name varchar
  description text
  seller_id int [ref: > Users.id]
  category_id int [ref: > Categories.id]
}

Table Bids {
  id int [pk, increment]
  auction_id int [ref: > Auction.id]
  buyer_id int [ref: > Users.id]
  amount decimal
  bid_time datetime
}
Table Categories {
  id int [pk, increment]
  name varchar [unique, not null]
  description text
}
