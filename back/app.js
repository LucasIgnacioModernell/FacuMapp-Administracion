import express from 'express';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import path from 'path';
import { fileURLToPath } from 'url';

// Routers
import { eventoRouter } from './routes/evento.js';
import { actividadRouter } from './routes/actividad.js';
import { espacioRouter } from './routes/espacio.js';
import { userRouter } from './routes/user.js';

// Middleware user
import { getUserData } from './middleware/user.js';

// FIX para __dirname en ESModules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

console.log('🚀 Servidor iniciando...');

const app = express();
const PORT = process.env.PORT || 3000;

const corsOptions = {
    origin: 'http://localhost:5173',
    credentials: true,
    sameSite: "None"
};

// Middlewares globales
app.disable('x-powered-by');
app.use("/uploads", express.static(path.join(__dirname, "uploads")));
app.use(cors(corsOptions));
app.use(express.json());
app.use(cookieParser());

// Middleware user 
app.use((req, res, next) => {
    try {
        getUserData(req, res, next);
    } catch {
        req.user = null;
        next();
    }
});


// ⭐⭐⭐ ENDPOINT DE PRUEBA ⭐⭐⭐
app.get("/test", (req, res) => {
    res.status(200).json({
        ok: true,
        message: "API funcionando correctamente 🚀",
        time: new Date().toISOString()
    });
});


// Routers principales
app.use(userRouter);
app.use(eventoRouter);
app.use(actividadRouter);
app.use(espacioRouter);


app.listen(PORT, () => {
    console.log(`server listening on port http://localhost:${PORT}`);
});
