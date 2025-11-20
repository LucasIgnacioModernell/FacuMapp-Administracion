export default function Espacios() {
  const espacios = [
    { id: 1, nombre: "Espacio A", desc: "Descripción del espacio A" },
    { id: 2, nombre: "Espacio B", desc: "Descripción del espacio B" },
    { id: 3, nombre: "Espacio C", desc: "Descripción del espacio C" }
  ];

  return (
    <div>
      <h1>Espacios</h1>
      <div className="row">
        {espacios.map((espacio) => (
          <div key={espacio.id} className="col-12 col-md-4 mb-3">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">{espacio.nombre}</h5>
                <p className="card-text">{espacio.desc}</p>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
