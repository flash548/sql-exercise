const express = require('express')
const bodyParser = require('body-parser')
const db = require('./queries')
const app = express()
const port = 3000

let allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Headers', "*");
    next();
}
app.use(allowCrossDomain);

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/users', db.getUsers)
app.get('/users/:id', db.getUserById)
app.post('/users', db.createUser)
app.put('/users/:id', db.updateUser)
app.delete('/users/:id', db.deleteUser)

app.get('/items', db.getItems)
app.post('/items', db.createItem)

app.get('/manufacturers', db.getManufacturers)
app.post('/manufacturers', db.createManufacturer)

app.post('/purchaseOrders', db.createPurchaseOrder)
app.get('/purchaseOrders', db.getPurchaseOrders)

app.post('/salesOrders', db.createSalesOrder)
app.get('/salesOrders', db.getSalesOrders)

app.post('/customers', db.createCustomer)
app.get('/customers', db.getCustomers)

app.get('/orderList', db.getOrderList)
app.get('/salesOrderList', db.getSalesOrderList)


app.listen(port, () => {
    console.log(`sql-exercise running on port ${port}.`)
  })

//Command for dumping SQL to file -> pg_dump -U me orders > orders.pgsql