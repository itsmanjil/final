const express = require("express");
const bodyParser = require("body-parser");
require("./database/mongoose");
const cors = require("cors");
//declaring dotenv inorder to read .env file necessary for token gen
const dotenv = require("dotenv");
const port = process.env.PORT || 4000;
const path = require("path");

dotenv.config({
  path: "../config.env",
});

const app = express();
const user = require("./routers/userrouter");
const product = require("./routers/productrouter");
const category = require("./routers/categoryrouter");
const fav = require("./routers/favoriteroutes");

app.use(bodyParser.urlencoded({ extended: false }));

app.use(cors());
app.use(express.json());
app.use(
  "/public/uploads/",
  express.static(path.join(__dirname, "/public/uploads/"))
);
app.use("/api/user", user);
app.use(`/api/products`, product);
app.use("/api/category", category);
app.use("/api/fav", fav);

app.get("/", (req, res) => {
  res.send("Hello from express");
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
