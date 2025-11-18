import { z } from 'zod'
export const actividadSchema = z.object({
    nombre: z.string().min(2, "El título no puede estar vacío").max(255, "El título no puede exceder 255 caracteres"),
    descripcion: z.string().min(3, "La descripcion no puede estar vacía"), 
    fecha: z
    .date()
    .refine((d) => d >= new Date(new Date().toDateString()), {
      message: "La fecha no puede ser anterior a hoy",
    }),
    hora_inicio: z.string().time(),
     hora_fin: z.string().time(),
    })
    .refine((data) => data.hora_fin > data.hora_inicio, {
    message: "La hora de fin debe ser posterior a la de inicio",
    path: ["hora_fin"],
});
