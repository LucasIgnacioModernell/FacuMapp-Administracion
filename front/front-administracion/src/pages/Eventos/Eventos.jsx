import { Link } from "react-router-dom";

export default function Eventos() {
  const eventos = [
    { id: 1, nombre: "Evento 1", desc: "Descripción del evento 1" },
    { id: 2, nombre: "Evento 2", desc: "Descripción del evento 2" }
  ];

  return (
    <div>
      <h1>Eventos</h1>
      <div className="row">
        {eventos.map((ev) => (
          <div key={ev.id} className="col-12 col-md-4 mb-3">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">{ev.nombre}</h5>
                <p className="card-text">{ev.desc}</p>
                <Link to={`/eventos/${ev.id}`} className="btn btn-primary">
                  Ver actividades
                </Link>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
