import express from 'express';
import cors from 'cors';

console.log('🚀 Servidor iniciando...');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(cors());
app.use(express.json());


app.get('/', (req, res) => {
    res.json({ 
        message: 'API Mapa Interactivo funcionando!',
        version: '1.0.0' 
    });
});

app.get('/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`✅ Servidor corriendo en puerto ${PORT}`);
});