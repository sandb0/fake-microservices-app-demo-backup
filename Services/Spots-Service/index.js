const express = require('express')
const os = require('os')

const app = express()

const port = process.env.PORT || 3001

app.use(express.json())

app.get('/spots', (request, response) => {
    console.log('Spots Service: []')

    const hostname = os.hostname

    const object = {
        name: `Hi! I am Spots Service on '${hostname}'.`,
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
    console.log('Hi! I am Spots Service.')
})

module.exports = app