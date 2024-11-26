<%-- 
    Document   : adminPreguntasFrecuentes
    Created on : 3 may. 2024, 14:42:26
    Author     : Adriana
--%>
<%@page import="DAO.PreguntaFrecuenteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Administración de Preguntas Frecuentes</title>
        <link rel="icon" href="../img/Captura1.ico">
        <link href="../css/cssadminPreguntasFrecuentes.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <style>
            #preguntasTable_wrapper {
                width: 100%;
                margin: 0 auto;
            }
            #preguntasTable_length {
                display: none;
            }
            #preguntasTable_paginate {
                text-align: center;
            }
            #preguntasTable_filter {
                float: right;
            }
            .hidden {
                display: none;
            }
        </style>
    </head>
    <body>
        <form id="addPreguntaForm" method="post">
            <h1>Ingrese Nueva Pregunta</h1>
            <label for="pregunta"><strong>Pregunta:</strong></label>
            <input type="text" id="pregunta" name="pregunta" required>
            <label for="respuesta"><strong>Respuesta:</strong></label>
            <textarea id="respuesta" name="respuesta" rows="4" required></textarea>
            <center><button type="submit">Agregar Pregunta</button></center>
        </form>

        <table id="preguntasTable" class="display">
            <thead>
                <tr>
                    <th class="hidden">ID</th>
                    <th>Pregunta</th>
                    <th>Respuesta</th>
                    <th>Acciones</th>
                </tr>
            </thead>
        </table>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function () {
                loadTable();

                $('#addPreguntaForm').on('submit', function (event) {
                    event.preventDefault();
                    addPregunta();
                });
            });

            function loadTable() {
                $('#preguntasTable').DataTable({
                    ajax: {
                        url: 'http://localhost:8081/api/preguntas',
                        dataSrc: ''
                    },
                    columns: [
                        {data: 'id', className: 'hidden'},
                        {data: 'pregunta'},
                        {data: 'respuesta'},
                        {
                            data: 'id',
                            render: function (data, type, row) {
                                return '<button class="btn btn-danger btn-sm" onclick="deletePregunta(' + data + ')">Eliminar</button>';
                            }
                        }
                    ],
                    lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                    language: {
                        lengthMenu: "Mostrar MENU registros por página",
                        zeroRecords: "No se encontraron resultados",
                        info: "Mostrando página PAGE de PAGES",
                        infoEmpty: "No hay registros disponibles",
                        infoFiltered: "(filtrado de MAX registros totales)",
                        search: "Buscar:",
                        paginate: {
                            first: "Primero",
                            last: "Último",
                            next: "Siguiente",
                            previous: "Anterior"
                        }
                    }
                });
            }

            function addPregunta() {
                var pregunta = $('#pregunta').val();
                var respuesta = $('#respuesta').val();

                $.ajax({
                    url: 'http://localhost:8081/api/preguntas',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({pregunta: pregunta, respuesta: respuesta}),
                    success: function (result) {
                        $('#preguntasTable').DataTable().ajax.reload();
                        Swal.fire('¡Éxito!', 'La pregunta ha sido agregada exitosamente.', 'success');
                        $('#pregunta').val('');
                        $('#respuesta').val('');
                    },
                    error: function (xhr, status, error) {
                        Swal.fire('¡Error!', 'Hubo un problema al agregar la pregunta.', 'error');
                    }
                });
            }

            function deletePregunta(id) {
                console.log('Deleting pregunta with id:', id); // Agrega esto para depuración
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: 'Esta acción no se puede revertir',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: 'Sí, eliminar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/ControladorPreguntaFrecuente',
                            type: 'POST',
                            data: {action: 'delete', id: id},
                            success: function (response) {
                                console.log('Success:', response); // Para depuración, verifica la respuesta del servidor
                                if (response.success) {
                                    $('#preguntasTable').DataTable().ajax.reload();
                                    Swal.fire('Eliminado!', 'La pregunta ha sido eliminada.', 'success');
                                } else {
                                    Swal.fire('Error!', 'Hubo un problema al eliminar la pregunta.', 'error');
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error('Error al eliminar:', xhr.responseText);
                                Swal.fire('Error!', 'Hubo un problema al eliminar la pregunta.', 'error');
                            }
                        });
                    }
                });
            }

        </script>
    </body>
</html>