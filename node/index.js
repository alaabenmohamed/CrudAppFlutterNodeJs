const express = require("express");
const app = express();
const port = 3000;
const colors = require("colors");
const cors = require("cors");
const pool = require("./db");

//middleware
app.use(cors());
app.use(express.json()); //req.body


app.get("/products", async (req, res) => {
  try {
    let sql = `SELECT * FROM products`;
    const allProducts = await pool.query(sql);
    res.json(allProducts.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.get("/products/:id", async (req, res) => {
  try {
    const { id } = req.params;
    let sql = `SELECT * FROM products WHERE id ='${id}' `;

    const products = await pool.query(sql);
    res.json(products.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.post("/products", async (req, res) => {
  try {
    const { code, description, price, quantity } = req.body;
    let sql = `INSERT INTO products (code, description,price, quantity) VALUES ('${code}','${description}','${price}','${quantity}') RETURNING *`;
    const newproduct = await pool.query(sql);
   console.log("post node ")
    res.json(newproduct.rows[0]);
  } catch (err) {
    console.error(err.message);
  }
});

app.delete("/products/:id", async (req, res) => {
  try {
    const { id } = req.params;
    let sql = `DELETE   FROM products WHERE id = '${id}'`;
    await pool.query(sql);
    res.json("products was deleted!");
  } catch (err) {
    console.log(err.message);
  }
});

app.put("/products/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const { code, description, price, quantity } = req.body;
    let sql = `UPDATE products SET code='${code}' , description ='${description}' , price='${price}' , quantity='${quantity}'  WHERE id='${id}'  `;
    await pool.query(sql);
    res.json("products was updated!");
  } catch (err) {
    console.error(err.message);
  }
});

app.use((req,res,next) => {
  res.status(404).json({
    message :"page not found "
  })
  
}
)
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`.blue);
  
});
