import { useState } from "react";
import "./app.scss";

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="container-fluid">
      <div className="row">

        {/* Sidebar */}
        <div
          className="col-12 col-md-2 bg-dark text-white p-3"
          id="sidebar"
        >
          <nav id="sidebar">
            <h4 className="mb-4">Menú</h4>

            <ul className="nav flex-column">
              <li className="nav-item">
                <a className="nav-link text-light" href="#">
                  🏠 Inicio
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-light" href="#">
                  📁 Proyectos
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-light" href="#">
                  👤 Perfil
                </a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-light" href="#">
                  ⚙️ Configuración
                </a>
              </li>
            </ul>
          </nav>
        </div>

        {/* Contenido */}
        <div className="col-12 col-md-10 p-4">
          <h1>Contenido Principal</h1>
          <p>Este es el contenido de la página a la derecha del menú.</p>
        </div>

      </div>
    </div>
  );
}

export default App;
