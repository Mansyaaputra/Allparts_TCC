const db = require("../config/Database");

exports.getAllProducts = () => {
  return db.execute(
    "SELECT * FROM products WHERE category = 'sparepart' OR category = 'sparepart-motor'"
  );
};

exports.getProductById = (id) => {
  return db.execute("SELECT * FROM products WHERE id = ?", [id]);
};

exports.createProduct = (
  name,
  price,
  stock,
  imageUrl,
  description,
  category
) => {
  // Paksa kategori menjadi 'sparepart-motor' untuk setiap produk baru
  return db.execute(
    "INSERT INTO products (name, price, stock, image_url, description, category) VALUES (?, ?, ?, ?, ?, ?)",
    [name, price, stock, imageUrl, description, "sparepart-motor"]
  );
};

exports.updateProduct = (
  id,
  name,
  price,
  stock,
  imageUrl,
  description,
  category
) => {
  // Paksa kategori menjadi 'sparepart-motor' untuk update
  return db.execute(
    "UPDATE products SET name = ?, price = ?, stock = ?, image_url = ?, description = ?, category = ? WHERE id = ?",
    [name, price, stock, imageUrl, description, "sparepart-motor", id]
  );
};

exports.deleteProduct = (id) => {
  return db.execute("DELETE FROM products WHERE id = ?", [id]);
};

exports.reduceProductStock = (id, quantity) => {
  return db.execute("UPDATE products SET stock = stock - ? WHERE id = ?", [
    quantity,
    id,
  ]);
};
