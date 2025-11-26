import { useState } from "react";

export default function Login() {
  const [username, setUserName] = useState("");
  const [password, setPassword] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost:3000/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ username, password }),
      });
      const data = await response.json();
      console.log(data);
    } catch (error) {
      console.error("Error al iniciar sesión:", error);
    }
  };

  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-12 col-md-4">
          <div className="card p-3">
            <h3 className="text-center">Login</h3>
            <form onSubmit={handleSubmit}>
              <input
                type="text"
                placeholder="Usuario"
                className="form-control mb-2"
                value={username}
                onChange={(e) => setUserName(e.target.value)}
              />
              <input
                type="password"
                placeholder="Contraseña"
                className="form-control mb-3"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
              <button type="submit" className="btn btn-primary w-100">
                Ingresar
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
