const Pool = require('pg').Pool
const pool = new Pool({
  user: 'me',
  host: 'localhost',
  database: 'orders',
  password: 'password',
  port: 5432,
})


/*USERS*/

const getUsers = (request, response) => {
    pool.query('SELECT * FROM users ORDER BY user_id ASC', (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).json(results.rows)
    })
}

const getUserById = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('SELECT * FROM users WHERE user_id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createUser = (request, response) => {
  const {fname, lname, email} = request.body

  pool.query('INSERT INTO users (fname, lname, email) VALUES ($1, $2, $3) RETURNING *', [fname, lname, email], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`User added with ID: ${results.insertId}`)
  })
}

const updateUser = (request, response) => {
  const id = parseInt(request.params.id)
  const {fname, lname, email } = request.body

  pool.query(
    'UPDATE users SET fname = $1, lname = $2, email = $3 WHERE user_id = $4',
    [fname, lname, email, id],
    (error, results) => {
      if (error) {
        throw error
      }
      response.status(200).send(`User modified with ID: ${id}`)
    }
  )
}

const deleteUser = (request, response) => {
  const id = parseInt(request.params.id)

  pool.query('DELETE FROM users WHERE user_id = $1', [id], (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).send(`User deleted with ID: ${id}`)
  })
}


/*ITEMS*/

const getItems = (request, response) => {
  pool.query('SELECT * FROM items ORDER BY item_id ASC', (error, results) => {
    if (error) {
      throw error 
    }
    response.status(200).json(results.rows)
  })
}

const createItem = (request, response) => {
  const {name, description} = request.body

  pool.query('INSERT INTO items (name, description) VALUES ($1, $2) RETURNING *', [name, description], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`Item added: ${name}`)
  })
}


/*MANUFACTURER*/

const getManufacturers = (request, response) => {
  pool.query('SELECT * FROM manufacturers ORDER BY manufacturer_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createManufacturer = (request, response) => {
  const {company_name, contact_name, contact_email, contact_phone} = request.body

  pool.query('INSERT INTO manufacturers (company_name, contact_name, contact_email, contact_phone) VALUES ($1, $2, $3, $4) RETURNING *', [company_name, contact_name, contact_email, contact_phone], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`Manufacturer added: ${company_name}`)
  })
}


/*PURCHASE ORDERS*/

const getPurchaseOrders = (request, response) => {
  pool.query('SELECT * FROM purchase_orders ORDER BY purchase_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createPurchaseOrder = async (request, response) => {
  const {user, quantity, manufacturer, item} = request.body
    console.log(request.body)
        
    let results = await pool.query('INSERT INTO purchase_orders (user_id) VALUES ($1) RETURNING *', [user]);
    var purchase_id = results.rows[0].purchase_id
    console.log(purchase_id) 

    for (var i = 0; i < quantity.length; i++) {
        let results =  await pool.query('SELECT item_id FROM items WHERE name = $1', [item[i]]);
        if (!results.rows[0]) {
            response.send("Item does not exist!")
            return;
        }
        var item_id = results.rows[0].item_id;    

        results = await pool.query('INSERT INTO purchase_items (quantity, item_id, purchase_id, manufacturer_id) VALUES ($1, $2, $3, $4) RETURNING *', [quantity[i], item_id, purchase_id, manufacturer[i]]);
    }

    response.status(201).send(`Purchase order successfully created with purchase ID ${purchase_id}`)

}

/*SALES ORDERS*/

const getSalesOrders = (request, response) => {
  pool.query('SELECT * FROM sales_orders ORDER BY sales_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const createSalesOrder = async (request, response) => {
  const {user, customer, quantity, item} = request.body

        
    let results = await pool.query('INSERT INTO sales_orders (user_id, customer_id) VALUES ($1, $2) RETURNING *', [user, customer]);
    var sales_id = results.rows[0].sales_id

    for (var i = 0; i < quantity.length; i++) {
        let results =  await pool.query('SELECT item_id FROM items WHERE name = $1', [item[i]]);
        if (!results.rows[0]) {
            response.send("Item does not exist!")
            return;
        }
        var item_id = results.rows[0].item_id;    

        results = await pool.query('INSERT INTO sales_items (item_id, sales_id, quantity) VALUES ($1, $2, $3) RETURNING *', [item_id, sales_id, quantity[i]]);
    }

    response.status(201).send(`Sales order successfully created with sales ID ${sales_id}`)

}

/*CUSTOMERS*/

const createCustomer = (request, response) => {
  const {customer_name, customer_email, customer_phone, company_name} = request.body

  pool.query('INSERT INTO customers (customer_name, customer_email, customer_phone, company_name) VALUES ($1, $2, $3, $4) RETURNING *', [customer_name, customer_email, customer_phone, company_name], (error, results) => {
    if (error) {
      throw error
    }
    response.status(201).send(`Customer added: ${customer_name}`)
  })
}

const getCustomers = (request, response) => {
  pool.query('SELECT * FROM customers ORDER BY customer_id ASC', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

/*PURCHASE/SALES ORDERS LIST TO DISPLAY */

const getOrderList = (request, response) => {
  pool.query('select users.fname, users.lname, purchase_items.purchase_id, purchase_orders.date_ordered, purchase_orders.date_received, manufacturers.company_name, items.name, purchase_items.quantity from purchase_items inner join purchase_orders on purchase_orders.purchase_id = purchase_items.purchase_id inner join users on purchase_orders.user_id = users.user_id inner join items on items.item_id = purchase_items.item_id inner join manufacturers on purchase_items.manufacturer_id = manufacturers.manufacturer_id', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getSalesOrderList = (request, response) => {
  pool.query('select users.fname, users.lname, sales_orders.date_ordered, sales_orders.date_received, customers.customer_name, items.name, sales_items.quantity from sales_items inner join sales_orders on sales_orders.sales_id = sales_items.sales_id inner join users on sales_orders.user_id = users.user_id inner join customers on customers.customer_id = sales_orders.customer_id inner join items on items.item_id = sales_items.item_id', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

module.exports = {
    getUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser,

    getItems,
    createItem,

    getManufacturers,
    createManufacturer,

    getPurchaseOrders,
    createPurchaseOrder,

    getSalesOrders,
    createSalesOrder,

    getCustomers,
    createCustomer,

    getOrderList,
    getSalesOrderList
}