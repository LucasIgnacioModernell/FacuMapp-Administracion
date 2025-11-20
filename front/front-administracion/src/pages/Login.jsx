export default function Login() {
  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-12 col-md-4">
          <div className="card p-3">
            <h3 className="text-center">Login</h3>
            <input type="text" placeholder="Usuario" className="form-control mb-2" />
            <input type="password" placeholder="Contraseña" className="form-control mb-3" />
            <button className="btn btn-primary w-100">Ingresar</button>
          </div>
        </div>
      </div>
    </div>
  );
}
