import { useParams } from "react-router-dom";

export default function EventoDetalle() {
  const { id } = useParams();

  const actividades = [
    { id: 1, nombre: "Actividad 1" },
    { id: 2, nombre: "Actividad 2" }
  ];

  return (
    <div>
      <h1>Actividades del Evento {id}</h1>
      <ul>
        {actividades.map((act) => (
          <li key={act.id}>{act.nombre}</li>
        ))}
      </ul>
    </div>
  );
}
