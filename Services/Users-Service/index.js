const express = require('express')
const os = require('os')

const app = express()

const port = process.env.PORT || 3000

app.use(express.json())

app.get('/users', (request, response) => {
    console.log('Users Service: []')

    const hostname = os.hostname

    const object = {
        name: `Hi! I am Users Service on '${hostname}'.`,
        url: {
            protocol: request.protocol,
            hostname: request.hostname,
            path: request.path,
            originalUrl: request.originalUrl,
            subdomain: request.subdomain,
        }
    }
    
    return response.json(object)
})

app.listen(port, () => {
    console.log('Hi! I am Users Service.')
})

module.exports = app