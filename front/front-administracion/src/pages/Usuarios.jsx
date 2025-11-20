export default function Usuarios() {
  const usuarios = [
    { id: 1, nombre: "Juan Pérez", rol: "admin" },
    { id: 2, nombre: "Ana López", rol: "normal" }
  ];

  return (
    <div>
      <h1>Usuarios</h1>
      <div className="row">
        {usuarios.map((u) => (
          <div key={u.id} className="col-12 col-md-4 mb-3">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">{u.nombre}</h5>
                <p className="card-text">Rol: {u.rol}</p>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
