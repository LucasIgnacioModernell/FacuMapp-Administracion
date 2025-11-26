import { BrowserRouter as Router, Routes, Route, Link, useLocation } from "react-router-dom";
import Home from "./pages/Home.jsx";
import Espacios from "./pages/Espacios/Espacios.jsx";
import Eventos from "./pages/Eventos/Eventos.jsx";
import EventoDetalle from "./pages/Eventos/EventoDetalle.jsx";
import Usuarios from "./pages/Usuarios.jsx";
import Login from "./pages/Login.jsx";
import "./App.scss";

const AppContent = () => {
  const location = useLocation();
  const isLoginPage = location.pathname === '/login';

  return (
    <div className="container-fluid">
      <div className="row">
        {!isLoginPage && (
          <div className="col-12 col-md-2 bg-dark text-white p-3" id="sidebar">
            <nav>
              <h4 className="mb-4">Menú</h4>
              <ul className="nav flex-column">
                <li className="nav-item"><Link className="nav-link text-light" to="/">Inicio</Link></li>
                <li className="nav-item"><Link className="nav-link text-light" to="/espacios">Espacios</Link></li>
                <li className="nav-item"><Link className="nav-link text-light" to="/eventos">Eventos</Link></li>
                <li className="nav-item"><Link className="nav-link text-light" to="/usuarios">Usuarios</Link></li>
              </ul>
            </nav>
          </div>
        )}

        <div className={isLoginPage ? "col-12" : "col-12 col-md-10 p-4"}>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/espacios" element={<Espacios />} />
            <Route path="/eventos" element={<Eventos />} />
            <Route path="/eventos/:id" element={<EventoDetalle />} />
            <Route path="/usuarios" element={<Usuarios />} />
            <Route path="/login" element={<Login />} />
          </Routes>
        </div>
      </div>
    </div>
  );
};

export default function App() {
  return (
    <Router>
      <AppContent />
    </Router>
  );
}
