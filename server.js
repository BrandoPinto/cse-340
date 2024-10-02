/* ******************************************
 * This server.js file is the primary file of the 
 * application. It is used to control the project.
 *******************************************/
/* ***********************
 * Require Statements
 *************************/
const express = require("express");
const expressLayouts = require("express-ejs-layouts");
const env = require("dotenv").config();
const app = express();

/* ***********************
 * View Engine and Template
 ************************/
app.set("view engine", "ejs");
app.use(expressLayouts);
app.set("layout", "./layouts/layout"); // Layout not at views root

/* ***********************
 * Serve Static Files (CSS, Images, etc.)
 ************************/
app.use(express.static('public')); // Servir archivos estáticos desde 'public'

/* ***********************
 * Routes
 *************************/
app.get('/', (req, res) => {
  res.render('index', { title: "Home" }); // Asegúrate de que 'views/index.ejs' existe
});

/* ***********************
 * Local Server Information
 * Values from .env (environment) file
 *************************/
const port = process.env.PORT
const host = process.env.HOST 

/* ***********************
 * Log statement to confirm server operation
 *************************/
app.listen(port, () => {
  console.log(`App listening on ${host}:${port}`);
});
