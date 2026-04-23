
document.addEventListener("DOMContentLoaded", () => {
  fetch("inventario.json")
    .then(response => {
      if (!response.ok) {
        throw new Error("Error al cargar el JSON");
      }
      return response.json();
    })
    .then(data => {

     alert("Trabajo hecho por Santiago");
      const contenedor = document.getElementById("tabla-contenedor");

      // Crear tabla
      const tabla = document.createElement("table");
      tabla.border = "1";

      // Crear cabecera
      const thead = document.createElement("thead");
      const filaCabecera = document.createElement("tr");

      const columnas = ["ID", "Tipo", "Marca", "Modelo", "Precio"];

      columnas.forEach(col => {
        const th = document.createElement("th");
        th.textContent = col;
        filaCabecera.appendChild(th);
      });

      thead.appendChild(filaCabecera);
      tabla.appendChild(thead);

      // Crear cuerpo de la tabla
      const tbody = document.createElement("tbody");

      data.dispositivos.forEach(dispositivo => {
        const fila = document.createElement("tr");

        fila.innerHTML = `
          <td>${dispositivo.id}</td>
          <td>${dispositivo.tipo}</td>
          <td>${dispositivo.marca}</td>
          <td>${dispositivo.modelo}</td>
          <td>${dispositivo.precio} €</td>
        `;

        tbody.appendChild(fila);
      });

      tabla.appendChild(tbody);
      contenedor.appendChild(tabla);
    })
    .catch(error => {
      console.error("Error:", error);
    });
});