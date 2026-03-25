import express from 'express';
import cors from 'cors';
import articleRoutes from './routes/articleRoutes.js';

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Routes
app.use('/api/articles', articleRoutes);

app.get('/', (req, res) => res.send('API Blog opérationnelle.'));

app.listen(PORT, () => {
    console.log(`Serveur démarré sur http://localhost:${PORT}`);
});