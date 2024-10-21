<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp" %>

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css"/>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h2 class="text-center mb-4">Class List</h2>

            <!-- Button to add new class -->
            <div class="mb-3 text-end">
                <a href="ClassController?action=new" class="btn btn-primary">Add New Class</a>
            </div>

            <!-- Class List Table -->
            <table id="classTable" class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Class Name</th>
                        <th>Teacher</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="classI" items="${listClass}">
                        <tr>
                            <td>${classI.classId}</td>
                            <td>${classI.className}</td>
                            <td>${classI.teacher.username}</td>
                            <td>
                                <a href="ClassController?action=edit&classId=${classI.classId}" class="btn btn-sm btn-warning">Edit</a>
                                <a href="ClassController?action=delete&classId=${classI.classId}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this class?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- DataTables JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<!-- Initialize DataTables -->
<script>
    $(document).ready(function() {
        $('#classTable').DataTable({
            "pagingType": "simple_numbers",
            "language": {
                "search": "Search:",
                "lengthMenu": "Show _MENU_ entries",
                "zeroRecords": "No matching records found",
                "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                "infoEmpty": "No entries available",
                "infoFiltered": "(filtered from _MAX_ total entries)",
                "paginate": {
                    "first": "First",
                    "last": "Last",
                    "next": "Next",
                    "previous": "Previous"
                }
            }
        });
    });
</script>

<%@ include file="footer.jsp" %>
