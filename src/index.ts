import express from 'express';
import cors from 'cors';
import {v4 as uuidv4} from 'uuid';


const PORT = process.env.PORT || 3000

const HOSTNAME = process.env.HOSTNAME || 'http://localhost'

const app = express()

app.get('/', (req, res) => {
    res.json({
        status: "OK",
        name: "node-api-deploy",
        datetime: (new Date()).toISOString(),
        uuid: uuidv4()
    })
})

app.use(cors)

app.use((req, res) => {
    res.status(404)
})

app.listen(PORT, () => {
    console.log(`Servidor rodando com sucesso ${HOSTNAME}:${PORT}`)
})
