enum Table {
  users(
      tableName: 'users',
      columnsQuery: '"id" integer not null primary key autoincrement,'
          '"login" text not null unique,'
          '"password" text not null,'
          '"role" integer not null'),
  categories(
      tableName: 'categories',
      columnsQuery: '"id" integer not null primary key autoincrement,'
          '"name" text not null unique'),
  products(
      tableName: 'products',
      columnsQuery: '"id" integer not null primary key autoincrement,'
          '"name" text not null unique,'
          '"price" real not null,'
          '"category_id" integer not null,'
          'foreign key("category_id") references "categories"("id")'),
  cartItems(
      tableName: 'cart_items',
      columnsQuery: '"customer_id" integer not null,'
          '"product_id" integer not null,'
          '"amount" integer not null,'
          'foreign key("customer_id") references "users"("id"),'
          'foreign key("product_id") references "products"("id")'),
  orders(
      tableName: 'orders',
      columnsQuery: '"id" integer not null primary key autoincrement,'
          '"customer_id" integer not null,'
          '"status" integer not null,'
          'foreign key("customer_id") references "users"("id")'),
  orderItems(
      tableName: 'order_items',
      columnsQuery: '"order_id" integer not null,'
          '"product_id" integer not null,'
          '"amount" integer not null,'
          'foreign key("order_id") references "orders"("id"),'
          'foreign key("product_id") references "products"("id")'),
  promoCodes(
      tableName: 'promo_codes',
      columnsQuery: '"id" integer not null primary key autoincrement,'
          '"code" text not null unique,'
          '"enabled" boolean not null');

  const Table({required this.tableName, required this.columnsQuery});

  final String tableName;
  final String columnsQuery;
}
